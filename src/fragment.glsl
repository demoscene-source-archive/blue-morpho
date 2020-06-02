#version 410
#define f2a_col gl_FragColor

uniform sampler3D volume;
uniform sampler3D volume2;
uniform sampler3D volume3;
uniform sampler3D volume4;
uniform sampler3D volume5;
uniform sampler3D volume6;
uniform sampler2D fstex;
uniform float time;
uniform float frame;
uniform int forvolume=1;
uniform float aspect_ratio;
uniform sampler3D voltex;
uniform int mode=0;
uniform float layer;

vec2 v2f_coord_UHH=forvolume==0?gl_FragCoord.xy/vec2(1280,720)*2-vec2(1):gl_FragCoord.xy/256.*2-vec2(1);

vec3 butterfly_position=vec3(7.6,.75,-2.25);

float seed = (int(frame)^int(gl_FragCoord.x)*19349663^int(gl_FragCoord.y)*83492791)%38069;
float rand() { return fract(sin(seed++)*43758.545); }

vec2 cmul(vec2 z0,vec2 z1)
{
   return vec2(z0.x * z1.x - z0.y * z1.y, z0.x * z1.y + z0.y * z1.x);
}

vec2 cpow(vec2 z,int e)
{
   vec2 z0=z;
   for(int i=1;i<e;++i)
   {
      z=cmul(z,z0);
   }
   return z;
}

vec2 cdiv(vec2 z0,vec2 z1)
{
   vec2 z1conj=vec2(z1.x,-z1.y);
   vec2 n=cmul(z0, z1conj);
   vec2 d=cmul(z1, z1conj);
   return n/d.x;
}

vec2 csq(vec2 z)
{
   return cmul(z, z);
}

vec2 cinv(vec2 z)
{
   return cdiv(vec2(1.0,0.0),z);
}

vec3 undergroundbackg(vec2 p)
{
	float time2=time+rand()*.03;
	p.x*=1.778;
	p.x-=.5;
	p.y-=time2/40.;
	vec3 col=vec3(0);
   vec2 z=vec2(0);
   for(int i=0;i<5;++i)
   {
      z=cpow(z,3)+p;
   }   

float ww=1.-smoothstep(1.,60.,length(z));
ww=1;
if(length(z)>6000)
{
z=normalize(z)*6000;
}

   z=cdiv(z - vec2(1, 0), z + vec2(1, 0));
float w=fwidth(atan(z.y,abs(z.x))/acos(-1)*12+log(length(z))*5);
float fr=fract(.5+atan(z.y,z.x)/acos(-1)*12+log(length(z))*5);
   col+=ww*smoothstep(1-w*2,1,min(fr,1.0-fr)*2);
col*=vec3(1.)*.02+.2*vec3(smoothstep(1.-w/4.,1.,1.-abs(fract(time2+log(length(z)))-.5)));

return col;
}

vec3 rotateX(float a, vec3 v)
{
   return vec3(v.x,
               cos(a) * v.y + sin(a) * v.z,
               cos(a) * v.z - sin(a) * v.y);
}

vec3 rotateY(float a, vec3 v)
{
   return vec3(cos(a) * v.x + sin(a) * v.z,
               v.y,
               cos(a) * v.z - sin(a) * v.x);
}

vec3 rotateZ(float a, vec3 v)
{
   return vec3(cos(a) * v.x + sin(a) * v.y,
               cos(a) * v.y - sin(a) * v.x,
               v.z);
}

//const int max_steps = 1;
const int max_steps = 64;

float hash(float n)
{
    return fract(sin(n)*43758.5453);
}

float noise(vec2 p)
{
   return hash(p.x + p.y*757.0);
}

float smoothNoise2(vec2 p)
{
   vec2 p0 = floor(p + vec2(0.0, 0.0));
   vec2 p1 = floor(p + vec2(1.0, 0.0));
   vec2 p2 = floor(p + vec2(0.0, 1.0));
   vec2 p3 = floor(p + vec2(1.0, 1.0));
   vec2 pf = smoothstep(0.0,1.0,fract(p));
   return mix( mix(noise(p0), noise(p1), pf.x), 
               mix(noise(p2), noise(p3), pf.x), pf.y);
}

float dither(vec2 p)
{
	return rand();
}

float height(float u, float v)
{
	return cos(u)*sin(v)/3.;
}

mat2 rotation(float u,float v)
{
	float ang=cos(u*3)*sin(v*7);
	return mat2(cos(ang),sin(ang),-sin(ang),cos(ang));
}

float pulse(vec3 p)
{
	return (.5+.5*cos(time*6+p.x*2+p.z*3));
}

float smin(float a,float b,float k){ return -log(exp(-k*a)+exp(-k*b))/k;}//from iq

float bladeRadiusScale = .7;  // .7


vec2 sampleVolume(sampler3D volume,vec3 p)
{
	return unpackUnorm2x16(packUnorm4x8(texture(volume, p)));
}

float grassPatternDistance(vec2 p)
{
   // Get the cell and sub-cell coordinates.
   vec2 ip = floor(p);
   vec2 fp = p - ip;

   // Mirror cells at odd coordinates.
   fp.x = mix(fp.x, 1. - fp.x, mod(ip.x + ip.y, 2.));

   // Fold fp into a triangle.
   fp = mix(fp, vec2(1.) - fp, step(fp.x, fp.y));

   // Distance to inscribed circle's centerpoint.
   float r = 1. - sqrt(.5);
   float o = .5 - r;
   float d = distance(fp, vec2(.5) - o * vec2(-1., 1.));

   // Apply an arbitrary scale to adjust the blade size.
   r *= bladeRadiusScale;

   // Transform the sample point into rotated lattice space.
   vec2 uv = vec2(dot(p, vec2(.5)), dot(p, vec2(.5, -.5)));

   // Distance to inscribed circle.
   float d0 = d - r;

   // Distance to circle centered on rotated lattice vertex. The distance is scaled to account for the scale of the lattice.
   float d1 = distance(fract(uv + vec2(.5)), vec2(.5)) * sqrt(2.) - r;

   // Combine the two primitives.
   return min(d0, d1);
}


float f(vec3 p)
{
float grass= grassPatternDistance(p.xz*3+pow(p.y,2)*.2)+max(0,pow(p.y+cos(p.x*8)*sin(p.z*3)*.1+.5,4)/4.+.05);
  if(p.z<0)
   {
      vec2 n=vec2(cos(acos(-1)*2./3.),sign(p.x)*sin(acos(-1)*2./3.));
      p.xz=p.xz-n*dot(p.xz,n)*2;
   }
float d0=-p.y-1.,d1=p.y-1.;
p.y+=exp(-abs(p.x))*.4-.6;
   float leaf=mode==3?length((p-vec3(0,.57-pow(length(p.xz)*.7-.3,2),.6))*vec3(1.5,5,1))-.3:1e2;
	float stem=mode==3?length(p.xz)-.07:1e2;
   return max(d1,max(d0,min(grass,smin(max(p.y-.4,stem),leaf,4))/16.));
}

float sampleTree(vec3 rp)
{
	rp=(rp-vec3(.5))*2.0;
	rp.y+=1.0;
	float ang=rp.z;
	float ang2=rp.x;
	rp=vec3(0.0,rp.y,0.0);
	rp.yz*=mat2(cos(ang),sin(ang),-sin(ang),cos(ang));
	rp.yx*=mat2(cos(ang2),sin(ang2),-sin(ang2),cos(ang2));
	rp.y-=1.0;
	rp=(rp+vec3(1.0))*0.5;
	float s = sampleVolume(voltex, vec3(rp.x,rp.z,1.0-rp.y)).g;
	return s;
}

float sampleTree2(vec3 rp)
{
	float s = sampleVolume(voltex, vec3(rp.x,rp.z,1.0-rp.y)).g;
	return s;
}

		float t=0;
		vec3 rp;
		vec4 s=vec4(0);
		vec3 c=vec3(0);
		float alpha=1;

	 float dith=dither(gl_FragCoord.xy),dof=3;
float fogamount=.015;	 
vec3 fogcol=vec3(0.5,0.5,1.0)/2.;
float focplan=6;

   vec3 ro = vec3(0.0, 0.0, 0), rd = normalize(vec3(v2f_coord_UHH * vec2(1., 1./aspect_ratio), -2.5));

	vec3 treeorigin=vec3(7,3.75,-20);

float linedist(vec2 l0,vec2 l1,vec2 p)
{
	return distance(p,mix(l0,l1,clamp(dot(p-l0,normalize(l1-l0))/distance(l0,l1),0.0,1.0)));
}

void march(float t0,float t1)
{
	vec3 rp3=ro;
		float wh;
    for(int i = 0; i < max_steps; i += 1)
    {
		 t=mix(t0,t1,(float(i)+dith) / float(max_steps));
      rp = ro + rd * t;
		rp3=rp;
		if(mode==3)
		{
			// waterwave
			wh=-19.+cos(distance(rp,vec3(6.5,-19.,-13.))*6.+time*6)*.2*step(62.,time)*cos(time*4)*exp(-(time-62.));
			if(rp.y<wh)
			{
				rp.y=wh-(rp.y-wh);
				dof=8;
			}
		}
		vec3 rp2=rp;
		float ll=log2(dof*abs(t-focplan));
		vec4 s2=vec4(0);
		if(mode==5)
		{
			// falling oranges
			rp.y+=time;
			vec3 c=floor(rp);
			rp.x+=cos(c.z*4.+c.y+time/4.)*2.-time;
			s = textureLod(volume5,fract(rp),ll);
			s.rgb*=mix(8.,1.5,smoothstep(0.,8.,time));
			c=floor(rp);
			s.a*=step(.95,noise(c.xz+c.y*10.))*step(4.,-c.x);
		}
		else
		{
			if(mode==3&&rp.y<-2.)
			{
				// underground
				rp.x+=cos(rp.y+rp.z)+cos(rp.y/4.+rp.z/2.);
				rp.z+=sin(rp.y/3.);
				vec3 orp=rp;
				float ll=log2(dof*abs(t-focplan));
				rp.x=7.-abs(rp.x-7.);
				rp/=3.;
				rp.x/=2.;
				rp.y+=mod(floor(rp.z),2.)*.5;
				vec2 cell=floor(rp.yz);
				rp.yz=fract(rp.yz);
				rp.xy=rp.yx;
				rp.x=1.-rp.x;
				s = textureLod(volume2,rp,ll);
				s.rgb=vec3(.37,.47,.5)*s.g*.2*(1.-smoothstep(-18.,-10.,rp2.y))*(.3+(1.-smoothstep(-19.,-15.5,rp2.y))*smoothstep(-16.,-15.,rp2.z)*10.*s.g*pow(1.-abs(smoothNoise2((rp2.xz+time))-.5),16.));
				s.rgb+=vec3(.01,.01,.02)*(1.-s.r);
				s.a*=step(.3,noise(cell+step(7.,orp.x)*4.))*step(-20.,orp.z);
			}
			else
			{
				float pp=pulse(rp);
				rp.x+=mod(floor(rp.z/2.+.5),2.0);
				rp.y+=height(rp.x/2.+.5,rp.z/2.+.5);
				vec3 orp=rp;
				rp.xz=(rotation(floor(rp.x/2.+.5),floor(rp.z/2.+.5))*(fract(rp.xz*.5+vec2(.5))-vec2(.5)))*2;
				s = textureLod(mode==2||mode==3?volume3:mode==4?volume4:volume,rp*.5+vec3(.5),ll);
				
				if(mode==0)
				{
					s2 = textureLod(volume2,(rp2-treeorigin)*vec3(.5,.25,.5)/2.+vec3(.5),ll);
					if(s2.a>.01)
						s.rgb=vec3(0);
					s2.rgb = s2.r*vec3(1,.9,.8)/2./7. + s2.g*vec3(1,.3,.1)*3.*step(48.,time);
					s2.rgb += vec3(.1)*(1.-s2.a);
					f2a_col.a=max(f2a_col.a,s2.a);
				}
				
				if(mode!=4)
				{
					if(s2.a<.1)
					{
						s.rgb+=vec3(1.,.6,.2)*(1.-smoothstep(4.,4.5,abs(orp.x+orp.z+8.)))*smoothstep(.1,.7,orp.y)/3.;
						if(mode==0)
							s.rgb+=vec3(1.,.6,.2)*(1.-smoothstep(-8.,18.,abs(orp.x+orp.z+8.)))*smoothstep(.0,.7,orp.y)*step(48.,time)*smoothstep(0.,1.,linedist(treeorigin.xz,treeorigin.xz+vec2(-10,10),orp.xz));
					}
				}
				else
				{
					// transform colours of s here
					s.rgb=s.r*vec3(.5,1.,.5)+s.g*vec3(4.)+s.b*vec3(2,2,1)*pp*16.;
					
					// transition from browngrass to greengrass
					s = mix(s, textureLod(volume,rp*.5+vec3(.5),ll), smoothstep(-.2,0.2,rp.y+2.*length(rp.xz)-time/5.+mod(floor(orp.z*.5+.5)*5+floor(orp.x*.5+.5)*7,3.)/2.5));
					/*
					// fruitfade
					if(time<5.)
					{
						s2 = textureLod(volume5,rp*.5+vec3(.5)+vec3(0,time/7.,0),ll+.5);
						s2.rgb*=1.+(.5+.5*cos(-time*2.5+rp.y*16.))*3.;
					}
					*/
					s = mix(s, s2, s2.a);
					s.rgb*=mix(vec3(.05,.1,.5),vec3(1.),smoothstep(0.,.5,distance(rp2,butterfly_position)));
				}

				s.a*=(1.-smoothstep(.95,1.,rp.y))*(1.-smoothstep(20.,40.,-orp.z));
			}
			if(mode==3)
			{
				// underground roots
				vec3 rp=rp2;
				rp.x+=smoothNoise2(vec2(0,rp.y/5.))-.75;
				rp.x-=6.5;
				rp.x/=3.;
				rp.y=(-(rp.y+2.))/25.;
				rp.z+=13.;
				rp.xz=rp.xz*.5+vec2(.5);
				rp.y=.8-rp.y;
				vec4 s2=textureLod(volume6,rp,ll);
				float rp2y=fract(rp2.y-max(62.,time)*2.);
				s2.rgb=vec3(.55,.25,.1)*(step(.93,rp2y)+smoothstep(.4,1.,max(rp2y,1.-rp2y))*.03)*(step(38.,time)+step(62.,time)*4.)+s2.r*vec3(.01,.01,.02);
				s2*=smoothstep(0.,.5,rp2.y-(-5.-time/3.+5.)+3.*(smoothNoise2(rp2.xz+time/6.)-.5));
				s=mix(s,s2,s2.a);
				s.rgb*=smoothstep(-2.,0.,ro.y)+1.-smoothstep(-6.,-4.,ro.y);
			}
		}
		
		if(mode==3&&rp3.y<wh)
		{
			// waterwave
			s.rgb+=vec3(.04)*(.7+.3*cos(time*5+length(rp3-vec3(6.5,-19.,-13.))*8.));
			s.a+=.05;
		}
		
		if(mode==0)
			s=mix(s,s2,s2.a);
		s.rgb = mix(fogcol, s.rgb, exp(-t*fogamount));
		c += s.rgb * s.a * alpha;
		alpha *= 1.0 - s.a;
		if(s.a>.99)
			break;
    }
	 
}

/*
vec4 butterfly(vec2 p)
{
p*=1.24;
vec4 c=vec4(1,1,1,0);
c.a=step(p.y,sin(abs(p.x)*1.5)*.7)*
      step(-sin(abs(p.x+cos(p.y*40.)/80.*step(.4,abs(p.x)))*3.4)*.8,p.y)*
      step(abs(p.x),pow(abs(p.y+abs(p.x)/7.),.25)*1.8);
c.a=max(c.a,step(length(p/vec2(1,3)+vec2(0,.02)),.07));
c.rgb=mix(vec3(.2,.4,.8),vec3(.6,.7,1),abs(p.x));
if(abs(p.x)<.05)
   c.rgb=vec3(0);
return c;
}
*/

vec4 hermite(mat4 m, float t)
{
    float t2 = t * t, t3 = t2 * t;
    return m * vec4(2.0 * t3 - 3.0 * t2 + 1.0, t3 - 2.0 * t2 + t, -2.0 * t3 + 3.0 * t2, t3 - t2);
}

vec3 catmullRom(mat4 m, float t)
{
    if(t > m[2].w)
        m = mat4(m[1], m[2], m[3], m[3] * 2.0 - m[2]);
    else if(t > m[1].w)
        m = mat4(m[0], m[1], m[2], m[3]);
    else
        m = mat4(m[0] * 2.0 - m[1], m[0], m[1], m[2]);

    t = (t - m[1].w) / (m[2].w - m[1].w);
    m = m * mat4(0.0, 1.0, 0.0, 0.0, -0.5, 0.0, 0.5, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, -0.5, 0.0, 0.5);
    return hermite(m, t).xyz;
}

float pattern(vec2 p, int n, vec2 o)
{
    p *= 0.5;
    vec2 t = vec2(cos(1.04719755), sin(1.04719755)) * 2.0;
    float m = 1.0;
    for(int i = 0; i < 8; i += 1)
    {
        if(i < n)
        {
            p = cdiv(vec2(1.0, 0.0), cmul(abs(fract(p) - vec2(0.5)), t));
            m = max(m, length(p) / 2.0);
        }
    }
    return 1.1 - exp(-distance(p, o) / m) * 1.6;
}

vec4 wingpattern(vec2 uv)
{
   vec4 fragColor=vec4(0.0, 0.0, 0.0, 1.0);

    mat4 m = mat4( vec3(0.1, 0.1, 0.2), 0.2,  vec3(0.2, 0.3, 0.42), 0.7,   
                vec3(1.0, 0.9, 0.5), 0.92, vec3(0.2, 0.3, 0.42), 1.0);
float time2=0;//time*3;
    for(int i = 0; i < 8; i+=1)
    {
        vec2 c = uv + float(i) * 5e-5;
        float p = pattern(c, 5, vec2(cos(time2 + c.y * 15.0) * 0.5, 0.0)) * 0.75 +
            pattern(c.yx, 6, vec2(0.0, sin(time2 * 0.5) * 0.5)) * 0.25 +
            pattern(c.yx * 2.0, 7, vec2(0.0, sin(time2 + c.x * 8.0))) * 0.2;
        fragColor.rgb += catmullRom(m, clamp(p * 0.9, 0.0, 1.0));
    }
    fragColor.rgb /= 8.0;
   return fragColor;
}

vec4 butterfly(vec2 p)
{
p*=1.24;
vec4 c=vec4(1,1,1,0);
float ws=-sin(abs(p.x+cos(p.y*40.)/80.*step(.4,abs(p.x)))*3.4)*.8;
float wt=sin(abs(p.x)*1.5)*.7;
float wm=pow(abs(p.y+abs(p.x)/7.),.25)*1.8;
float wm2=pow(abs(p.y+.02+abs(p.x)/7.),.25)*1.8;
c.a=step(p.y,wt)*
      step(ws,p.y)*
      step(abs(p.x),wm);
c.a=max(c.a,step(length(p/vec2(1,3)+vec2(0,.02)),.07));
c.rgb=mix(vec3(.6,.9,1),vec3(.2,.4,.8),2.*pow(abs(abs(p.x)-.5)+.3*abs(fract((p.y+smoothNoise2(p*5)/10.)*8+pow(abs(p.x)*(-p.y+2.)/1.,2.))-.5),2));
c.rgb*=smoothstep(ws-.01,ws+.1,p.y-.02);
c.rgb*=smoothstep(p.y-.01,p.y+.06,wt);
c.rgb*=smoothstep(abs(p.x)-.1,abs(p.x)+.3,wm2);
if(abs(p.x)<.05)
   c.rgb=vec3(0);
 c.rgb=mix(c.rgb,vec3(dot(c.rgb,vec3(1./3.))),.4);
//c.rgb*=wingpattern(clamp(p/1.1,-1,1)).rgb;
c.rgb*=texture(fstex,clamp(p/1.1,-1,1)*.5+vec2(.5)).rgb;
return c;
}


void main()
{
	if(mode==7)
	{
		f2a_col.rgb=wingpattern(v2f_coord_UHH).rgb;
		f2a_col.a=1.;
		return;
	}
	
	if(forvolume==2)
	{
			vec2 v2f_coord=v2f_coord_UHH*.5+vec2(.5);
			 vec3 p = vec3(v2f_coord, layer);

		  float tt=float(frame)/32000.0+cos(p.x*9)*cos(p.y*7)*0.2;
		  float scale=mix(1.0, .0625, clamp(tt,0.0,1.0));

			 float F=mix(0.0299,0.03,clamp((1.0-p.z)/0.2,0.0,1.0));
		float  K=mix(0.621,0.062,clamp((1.0-p.z)/0.2,0.0,1.0));//0.062;
		float  diffusionRateU=2.*scale;//1.0/4.0;
		float  diffusionRateV=scale;//1.0/8.0;
		float  delta=0.1+cos(p.x*8)*cos(p.y*11+1.0)*0.05;

			 f2a_col = vec4(0);
			 
			 vec2 c=sampleVolume(voltex,p).rg;
			 vec2 lap=vec2(0);
			 
			 float s=1./textureSize(voltex,0).x;
			
			 lap += sampleVolume(voltex,p+vec3(-1,0,0)*s).rg;
			 lap += sampleVolume(voltex,p+vec3(+1,0,0)*s).rg;
			 lap += sampleVolume(voltex,p+vec3(0,-1,0)*s).rg;
			 lap += sampleVolume(voltex,p+vec3(0,+1,0)*s).rg;

			lap-=c*4;
			 
			 float dU=lap.r*diffusionRateU - c.r * c.g * c.g + F * (1.0 - c.r);
			 float dV=lap.g*diffusionRateV + c.r * c.g * c.g - (F + K) * c.g;
			 
			 f2a_col.rg=c+vec2(dU,dV)*delta;
			 
			 if(length((p.xy-vec2(.5))/vec2(1,2))<.02&&frame<40)
			 {
				 f2a_col.g=0.5;
			 }
			f2a_col=unpackUnorm4x8(packUnorm2x16(f2a_col.rg));

	}
	else if (forvolume==1)
	{
		vec2 v2f_coord=v2f_coord_UHH*.5+vec2(.5);
		 vec3 p = vec3(v2f_coord, layer),v=(p-vec3(.5))*vec3(4,1,4)/2;

		  f2a_col=vec4(0);

			if(mode==1)
			 {
				vec3 rp = vec3(p.x,1.-p.y,p.z);
				
				vec3 e=vec3(1e-2,0.0,0.0);
				vec3 n=vec3(sampleTree(rp+e.xyy) - sampleTree(rp-e.xyy),
								sampleTree(rp+e.yxy) - sampleTree(rp-e.yxy),
								sampleTree(rp+e.yyx) - sampleTree(rp-e.yyx));
				n=normalize(n);

				float s=sampleTree(rp);
				float iso=mix(0.2,0.35,clamp((1.0-rp.y),0.0,1.0));
				f2a_col.r=.5+.5*n.y;
				f2a_col.g=max(0,dot(n,normalize(vec3(-1,0,.7))));
				f2a_col.a=smoothstep(iso-.002,iso,s);
				return;
			 }
			else if(mode==5)
			 {
				vec3 rp = vec3(p.x,1.-p.y,p.z);
				
				vec3 e=vec3(1e-2,0.0,0.0);
				vec3 n=vec3(sampleTree2(rp+e.xyy) - sampleTree2(rp-e.xyy),
								sampleTree2(rp+e.yxy) - sampleTree2(rp-e.yxy),
								sampleTree2(rp+e.yyx) - sampleTree2(rp-e.yyx));
				n=normalize(n);

				float s=sampleTree2(rp);
				f2a_col.r=.5+.5*n.y;
				f2a_col.g=max(0,dot(n,normalize(vec3(-1,0,.7))));
				f2a_col.a=smoothstep(.3-.004,.3,s);
				return;
			 }
			else
			{
		 vec3 g=p*2-vec3(1);

			 
		 // FRUIT
		 float fy=.55;
		float fr=.25;//*smoothstep(-.1,0.11,distance(p.xz,vec2(.5,.5)));
		float d=distance(p,vec3(.5,fy,.5));

		 
		if(mode!=4)
		{
			// plant volume generation
			 vec3 n=normalize(v);
			float eps=1e-5;
			float ndotl=(f(g+vec3(0,eps,0))-f(g))/eps;

			f2a_col.r=(.9+.1*cos(length(g.xz)*63))*clamp(.5+.5*ndotl,0,1)/2.*pow(p.y,2);
			f2a_col.g=pow(clamp(.5+.5*ndotl,0,1),8.)*sqrt(clamp(p.y+1.,0.,1.));

			f2a_col.a=1.-smoothstep(0.0,.002,f(g));

			if(mode==3)
			{
				//f2a_col.rgb=f2a_col.r*vec3(.5,1.,.5)+f2a_col.g*vec3(4.)+f2a_col.b*vec3(2,2,1); // greengrass 

				// small glowing orbs
				if(distance(g,vec3(.2,.05,.2))<.03)
				{
					f2a_col.a=1.;
					f2a_col.rgb=vec3(0,0,1.);
				}
			}
			else
			{
				f2a_col.rgb=f2a_col.r*vec3(1.0,0.4,.05)/1.+f2a_col.g*vec3(4.)+f2a_col.b*vec3(2,2,1); // browngrass
				f2a_col.rgb=mix(f2a_col.rgb,vec3(.9),smoothstep(.5,.8,p.y+cos(p.x*15)*cos(p.z*12.5)*.1)/10.);
			}
		}
		
		f2a_col.rgb*=max(smoothstep(0.,.7,p.y), smoothstep(-.1,.5,distance(p.xz,vec2(.5))));

		// fruit
		if(mode==2||mode==4)
		{
			
			if(mode==4)
				f2a_col.rgb=smoothstep(-.3,.3,d)* mix(vec3(1.,0.15,0.)/3.,vec3(1.,0.15,0.)+vec3(1,.4,0)*smoothstep(.0,.3,p.y-fy),smoothstep(-.3,+.6,p.y-fy)); // total fruit
			else
				f2a_col.rgb=mix(f2a_col.rgb,smoothstep(0.,.3,d)* mix(vec3(1.,0.15,0.)/3.*vec3(0,.5,0),vec3(1.,0.15,0.)+vec3(1,.4,0)*smoothstep(.0,.3,p.y-fy),smoothstep(-.3,+.6,p.y-fy)),smoothstep(-0.1,0.0,fr-d));

			if(d<fr)
			{
				f2a_col.a=smoothstep(0.0,0.01,fr-d);
			}
		}

		}

	}
	else
	{
		if(mode==6)
		{
			//f2a_col=vec4(1,0,1,1);
			f2a_col=vec4(undergroundbackg(v2f_coord_UHH*.5+vec2(.5)),1);
			return;
		}
		
			float butterfly_time=time+rand()*.01;
			float wa=.8+cos(butterfly_time*4)*.2,wb=0;
			if(mode==4&&butterfly_time>21.8)
			{
				butterfly_position.y+=(butterfly_time-(22.))/3.+abs(sin((butterfly_time-22.)*7.))*.2+abs(sin((butterfly_time-22.)*2.))*.4;
				wa=.2+cos(butterfly_time*9)*1.2;
				butterfly_position.x-=(butterfly_time-(22.))/1.5;
				butterfly_position.z-=(butterfly_time-(22.))/1.5;
				wb=(butterfly_time-22.)/5.;
			}
			
			vec2 original_v2f_coord=v2f_coord_UHH;
			vec2 v2f_coord=original_v2f_coord*mix(1.22,1.,smoothstep(0.,70.,time));

			 f2a_col.rgb=vec3(0.);

			 if(mode==1)
			 {
					vec2 sc=vec2(16.,9.)*2;
					vec2 p=v2f_coord.xy*sc;
					vec2 c=floor(p),f=p-c;
					float s=pow(texture(fstex,(c+vec2(.5))/(sc*2.)+vec2(.5)).b,.5)*(1.-texture(fstex,(c+vec2(.5))/(sc*2.)+vec2(.5)).a*1.2)*pow(v2f_coord.y/2.+.5,2.);
					vec4 ff=texture(fstex,v2f_coord.xy/2.+vec2(.5));
					ff.a*=smoothstep(-.7,-.52,v2f_coord.y);
					f2a_col.rgb=ff.rgb*smoothstep(24.-14.*ff.a,40.,time);
					f2a_col.rgb=mix(vec3(dot(f2a_col.rgb,vec3(1./3.))),f2a_col.rgb, smoothstep(12.,40.,time));
					if(noise(c)*pow(smoothstep(15.,40.,time),2.)<s+1e-4&&(noise(c*3)+clamp(time/15.,0.,1.))>.999)
					{
						float x=1.-smoothstep(22.,35.,time)/1.2;
						f2a_col.rgb=f2a_col.rgb+(1.-smoothstep(0.,.05,distance(f,vec2(.5+(noise(c)*2-1)*.4,.5+(noise(c+10.)*2-1)*.4))))/2.*mix(.1,4.,pow(smoothNoise2(c*7+time),2.))*x;
						f2a_col.rgb=f2a_col.rgb+vec3(1.,1.,.5)*(1.-smoothstep(0.,.3,distance(f,vec2(.5+(noise(c)*2-1)*.4,.5+(noise(c+10.)*2-1)*.4))))/2.*mix(.1,4.,pow(smoothNoise2(c*7+time),2.))/50.*x;
					}
			 }
			 else
			 {
		if(mode==5)
		{
			float angx=-.6;
			rd=rotateX(angx,rd);
			ro+=rd*1;
			focplan=11;
			dof=8;
		}
		else if(mode==0)
		{
			ro.x+=7.;
			ro.x+=smoothstep(74.,89.,time)*4.;
			ro.y+=3.2;
			ro+=rd*8;
			focplan=11;
			dof=4;
		}
		else
		{	
			if(mode==2)
			{
				 float angx=.3;
				ro.z+=6.5;
				ro=rotateX(angx,ro);
				rd=rotateX(angx,rd);
				  
				ro.x+=time/3.;
				ro.z-=time/6.;
				ro.y+=.5;
			}
			else if(mode==4)
			{
				 float angx=.3;
				ro.z+=6.5;
				ro=rotateX(angx,ro);
				rd=rotateX(angx,rd);
				  
				float x=max((time-18.)/5.,0.);
				float offset=min(time,18.)+(1.-exp(-x))*5.;
				ro.x+=offset/3.;
				ro.z-=offset/6.;
				ro.y+=.5;
				focplan=5.25;
			}
			else if(mode==3)
			{
				float x=max((time-56.)/4.,0.);
				float offset=min(time,56.)+(1.-exp(-x))*4.;
				ro.x+=7.;
				ro.y+=1.8-offset/3.;
				ro+=rd*8;
				focplan=4;
				dof=4;
			}
			else
			{
				ro.x+=7.;
				ro.y+=1.8-time/3.;
				ro+=rd*8;
				focplan=4;
				dof=4;
			}
		}


			if(mode==0)
			{
			// for the intro
			fogcol=mix(vec3(.03),vec3(0.02,0.1,0.15)/4.,v2f_coord.y)*2.*smoothstep(19.,29.,time);
			fogcol+=vec3(1.2,.7,.3)*pow(max(0.,v2f_coord.x/2.2+.2),2.)*(1.-v2f_coord.y)*step(48.,time)/4.;
			}
			else if(mode==5)
			{
			// for the fruits in the air
			fogcol=mix(vec3(.8,.4,.3)/9.,mix(vec3(.8,.5,.4)/4.,vec3(.9,.9,1.),clamp((rd.y-.02)*2.,0.,1.)),smoothstep(-.05,.1,rd.y+(sin(rd.x*8)+cos(rd.x*12+.4))/30.))/20.;
			}
			else if(mode==3)
			{
				vec3 uptn=vec3(0);
				for(int y=-8;y<8;++y)
				{
					for(int x=-8;x<8;++x)
					{
						uptn+=texture(fstex,original_v2f_coord.xy/2.+vec2(.5)+vec2(x*9./16.,y)*.002).rgb*step(length(vec2(x,y)),8.);
					}
				}
				fogcol=mix(
								mix(vec3(.5,.4,.3)/9.,mix(vec3(.5,.5,.4)/4.,vec3(1),clamp((rd.y-.02)*2.,0.,1.)),smoothstep(-.05,.1,rd.y+(sin(rd.x*8)+cos(rd.x*12+.4))/30.)), // for the fruits on the ground
								(1.-smoothstep(-9.,-1.,ro.y))*vec3(0.8,0.8,1.0)/20.+(1.-smoothstep(-14.,-4.,ro.y))*uptn/64., // for the underground
							1.-smoothstep(-1.5,-1.,ro.y));
			}
			else
			{
				fogcol=mix(vec3(.5,.4,.3)/9.,mix(vec3(.5,.5,.4)/4.,vec3(1),clamp((rd.y-.02)*2.,0.,1.)),smoothstep(-.05,.1,rd.y+(sin(rd.x*8)+cos(rd.x*12+.4))/30.));
			}

			vec3 oro=ro;
			vec3 ord=rd;
			
			if(mode==4)
			{
				fogcol=vec3(0.5,0.5,1.0)/2.;
			}
			
		if(mode==3)
		{
			march(3.,4.);
			march(4.,6.);
			march(6.,21.);
		}
		else if(mode==5)
		{
			march(3.,6.);
			march(6.,9.);
			march(9.,21.);
		}
		else if(mode==0)
		{
			march(5.,10.25);
			march(10.25,12.);
			march(12.,25.);
		}
		else if(mode==2)
		{
			march(3.5,6.5);
			march(6.5,9.5);
			march(9.5,25.);
		}
		else if(mode==4)
		{
			march(2.5,6.5);
			march(6.5,9.5);
			march(9.5,25.);
		}
		else
		{
			march(3.,6.5);
			march(6.5,9.5);
			march(9.5,40.);
		}

			f2a_col.rgb=c;
			 f2a_col.rgb+=fogcol*alpha*smoothstep(-1,0,rd.y);

		
		if(mode==0)
		{
	f2a_col.rgb/=3.;
			
			if(v2f_coord.x>-.35&&v2f_coord.y>-.1)
			// leaves in the tree
			for(int i=50;i<220;++i)
			{
				vec3 n=normalize(vec3(cos(i),-.6+cos(i*2.3)*.5,sin(i*1.2)));
				vec3 pos=n*vec3(2,-2,2)+treeorigin+vec3(-.14,.05,0);
				float x=max(0.,(time+rand()*.02-(pos.x-10.)*1.2-79.)*.3+cos(i*3.3)*.4);
				pos.x-=(1.-exp(x))*x;
				pos=oro-pos;
				pos=rotateZ(i*3.2,pos);
				vec3 rd2=rotateZ(i*3.2,rd);
				float is=-pos.z/rd2.z;
				pos+=rd2*is;
				pos*=2.;
				if(abs(pos.x)<1.&&abs(pos.y)<1.&&step(f2a_col.a,.7+step(0.,cos(i*7)))>.5)
				{
					pos/=5.;
					pos.x=abs(pos.x)/3.;
					f2a_col.rgb=mix(f2a_col.rgb,(1.+max(0.,n.x*1.5*step(48.,time)))*vec3(1.8,.6,.2)*0.02*(.6+.4*smoothstep(.0002,.0008,pos.x)*smoothstep(0.05,0.08,fract((pos.x+pos.y)*50.)))*(.75+.25*cos(i*9)),.75*smoothstep(pos.x-.01,pos.x,pow(pos.y,.7)*.3-pos.y/2.));
				}
			}

			// oranges in the tree
			for(int i=0;i<50;++i)
			{
				vec3 pos=normalize(vec3(cos(i),-.6+cos(i*2)*.5,sin(i*1.2)))*vec3(2,-2,2)+treeorigin+vec3(-.14,.05,0);
				float x=max(0.,(time+rand()*.02-(pos.x-10.)*1.2-77.)*.3+cos(i)*.1);
				pos.x-=(1.-exp(x))*x;
				pos.y+=(1.-exp(x))*x*sin(i)*.2;
				float d=dot(normalize(ord*vec3(1,1,1)),normalize(pos-oro));
				if(time>60.+i/30.)
				{
				f2a_col.rgb+=(.01+.99*step(f2a_col.a,.7+step(0.,cos(i*7))))*vec3(1,.5,.1)*(smoothstep(.99997,.99998,d)-.3*smoothstep(.99998,.99999,d))*2.;
				f2a_col.rgb+=vec3(1,.5,.1)*smoothstep(.95,1.,d)/250.;
				}
			}
		}

		f2a_col.rgb+=vec3(noise(gl_FragCoord.xy)/255.);

			 }

		if(mode!=0)
		{
			if(mode==5)
			{
				f2a_col.rgb+=vec3(1.,.7,.2)*(1.-smoothstep(0.,10.,time))/6.;
				f2a_col.rgb*=smoothstep(0.,1.,time)-smoothstep(11.,12.,time);
			}
			if(mode==1)
			{
				v2f_coord+=vec2(.6,-.3);
				v2f_coord.x-=v2f_coord.y/2.;
				v2f_coord.y+=(time-41.)*2.;
				v2f_coord.y/=2.;
				f2a_col.rgb+=vec3(exp(-abs(time-41.)*50.)*exp(300.*-length(v2f_coord*vec2(1.,1.-.92*step(0.,v2f_coord.y)))));
				//f2a_col.rgb+=vec3(1.-smoothstep(.0,.01,abs(v2f_coord.x)));
				f2a_col.rgb*=1.-smoothstep(81.,82.,time);
			}
			if(mode==2)
			{
				f2a_col.rgb*=smoothstep(0.,1.,time)-smoothstep(8.,10.,time);
			}
			if(mode==3)
			{
				if(time>=62.)
				{
					// underground lens flare
					vec2 p=original_v2f_coord.xy;
					p.x*=2.;
					p.x+=.13;
					p.y+=.4;
					f2a_col.rgb+=(.85+.15*cos(time*10.))*vec3(2.,1.3,.5)*(.01/(abs(p.y)+0.01)/(abs(p.x)+.15))/3.*exp(-length(p));
				}

				f2a_col.rgb*=smoothstep(0.,1.,time)-smoothstep(65.,66.,time);
			}
			if(mode==4)
			{
			// butterfly
				ro-=butterfly_position;
				ro*=2.;
				mat2 r=mat2(cos(wb),sin(wb),-sin(wb),cos(wb));
				wb=-.2;
				mat2 r2=mat2(cos(wb),sin(wb),-sin(wb),cos(wb));
				rd.xz*=r;
				ro.xz*=r;
				rd.xy*=r2;
				ro.xy*=r2;
				vec3 ord=rd;

				vec4 bc=vec4(0.);
				for(int iy=-2;iy<3;++iy)
					for(int ix=-2;ix<3;++ix)
					{
						vec3 rd=ord;
						rd.xy+=vec2(ix,iy)*.0003;
						vec3 n=normalize(vec3(0,cos(-wa),sin(-wa)));
						float t=-dot(ro,n)/dot(rd,n);
						if(t>0.&&(ro+rd*t).y>0)
						{
							float u=length((ro+rd*t).zy);
							float v=-(ro+rd*t).x;
							vec4 c=butterfly(vec2(u,v));
							if(c.a>.5)
							{
								bc+=c;
							}
							else
							{   
								vec3 n=normalize(vec3(0,cos(wa),sin(wa)));
								float t=-dot(ro,n)/dot(rd,n);
								if(t>0.&&(ro+rd*t).y>0)
								{
									float u=length((ro+rd*t).zy);
									float v=-(ro+rd*t).x;
									vec4 c=butterfly(vec2(u,v));
									bc+=c;
								}
							}
						}
					}

				f2a_col.rgb+=vec3(0.2,0.3,0.4)/3.*pow(max(0.,v2f_coord.y),4.);

				bc/=25.;
				bc.rgb+=fogcol*.2;
				f2a_col.rgb=mix(f2a_col.rgb,bc.rgb,bc.a);

				f2a_col.rgb*=smoothstep(2.,3.,time)-smoothstep(23.,28.,time);
			}
		  f2a_col.rgb*=vec3(1.- (pow(abs(original_v2f_coord.x),4) + pow(abs(original_v2f_coord.y),4))*.2);
		  f2a_col.rgb=(f2a_col.rgb/(f2a_col.rgb+vec3(.4)))*2.;
			f2a_col.rgb+=vec3(noise(gl_FragCoord.xy+57.)/255.);
		}


	}

}

