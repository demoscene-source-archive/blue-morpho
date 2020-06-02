#pragma warning( disable : 4730 )
#pragma warning( disable : 4799 )

#define WIN32_LEAN_AND_MEAN
#define WIN32_EXTRA_LEAN
#include <windows.h>
#include "../config.h"
#include <GL/gl.h>
#include "../glext.h"
#include "../shader_code.h"
#include "../clinkster.h"

static const PIXELFORMATDESCRIPTOR pfd = {
    sizeof(PIXELFORMATDESCRIPTOR), 1, PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|PFD_DOUBLEBUFFER, PFD_TYPE_RGBA,
    32, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 32, 0, 0, PFD_MAIN_PLANE, 0, 0, 0, 0 };

static DEVMODE screenSettings = { {0},
    #if _MSC_VER < 1400
    0,0,148,0,0x001c0000,{0},0,0,0,0,0,0,0,0,0,{0},0,32,XRES,YRES,0,0,      // Visual C++ 6.0
    #else
    0,0,156,0,0x001c0000,{0},0,0,0,0,0,{0},0,32,XRES,YRES,{0}, 0,           // Visuatl Studio 2005
    #endif
    #if(WINVER >= 0x0400)
    0,0,0,0,0,0,
    #if (WINVER >= 0x0500) || (_WIN32_WINNT >= 0x0400)
    0,0
    #endif
    #endif
    };

#ifdef __cplusplus
extern "C" 
{
#endif
int  _fltused = 0;
#ifdef __cplusplus
}
#endif

#define VOLUME_SIZE 256

#define MAX(a,b) (((a)>(b))?(a):(b))

//----------------------------------------------------------------------------

static char *strs[] = {
	"glCreateShaderProgramv",
	"glTexStorage3D",
	"glUseProgram",
	"glCopyTexSubImage3D",
	"glGenerateMipmap",
	"glGetUniformLocation",
	"glActiveTexture",
	"glUniform1i",
	"glUniform1f",
    };

#define NUMFUNCIONES (sizeof(strs)/sizeof(strs[0]))

void *myglfunc[NUMFUNCIONES];

#define oglCreateShaderProgramv	      ((PFNGLCREATESHADERPROGRAMVPROC)myglfunc[0])
#define oglTexStorage3D		            ((PFNGLTEXSTORAGE3DPROC)myglfunc[1])
#define oglUseProgram									((PFNGLUSEPROGRAMPROC)myglfunc[2])
#define oglCopyTexSubImage3D		      ((PFNGLCOPYTEXSUBIMAGE3DPROC)myglfunc[3])
#define oglGenerateMipmap		          ((PFNGLGENERATEMIPMAPPROC)myglfunc[4])
#define oglGetUniformLocation		      ((PFNGLGETUNIFORMLOCATIONPROC)myglfunc[5])
#define oglActiveTexture							((PFNGLACTIVETEXTUREPROC)myglfunc[6])
#define oglUniform1i									((PFNGLUNIFORM1IPROC)myglfunc[7])
#define oglUniform1f									((PFNGLUNIFORM1FPROC)myglfunc[8])


void entrypoint( void )
{
    // full screen
    //if( ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN)!=DISP_CHANGE_SUCCESSFUL) return;
    ChangeDisplaySettings(&screenSettings,CDS_FULLSCREEN);
    ShowCursor( 0 );
    // create window
    HWND hWnd = CreateWindow( "static",0,WS_POPUP|WS_VISIBLE,0,0,XRES,YRES,0,0,0,0);
//    if( !hWnd ) return;
    HDC hDC = GetDC(hWnd);
    // initalize opengl
    SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd);
    //if( !SetPixelFormat(hDC,ChoosePixelFormat(hDC,&pfd),&pfd) ) return;
    wglMakeCurrent(hDC,wglCreateContext(hDC));

    for( int i=0; i<NUMFUNCIONES; i++ )
    {
        #ifdef WIN32
        myglfunc[i] = wglGetProcAddress( strs[i] );
        #endif
        #ifdef LINUX
        myglfunc[i] = glXGetProcAddress( (const unsigned char *)strs[i] );
        #endif
    }

		for(int i=0;i<4;++i)
		{
			glBindTexture(GL_TEXTURE_3D, 1+i);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_BORDER);
			oglTexStorage3D(GL_TEXTURE_3D, 8, GL_RGBA8, VOLUME_SIZE, VOLUME_SIZE, VOLUME_SIZE);
		}

		for(int i=4;i<6;++i)
		{
			glBindTexture(GL_TEXTURE_3D, 1+i);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_BORDER);
			glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_BORDER);
			oglTexStorage3D(GL_TEXTURE_3D, 8, GL_RGBA8, VOLUME_SIZE, VOLUME_SIZE, VOLUME_SIZE);
		}


		glBindTexture(GL_TEXTURE_3D, 7);
		glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_BORDER);
		glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_BORDER);
		glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_BORDER);
		oglTexStorage3D(GL_TEXTURE_3D, 1, GL_RGBA8, VOLUME_SIZE, VOLUME_SIZE, VOLUME_SIZE);

		glBindTexture(GL_TEXTURE_2D, 8);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

    static const char *const fs = fragment_glsl;
		const GLuint prog = oglCreateShaderProgramv(GL_FRAGMENT_SHADER, 1, &fs);
		oglUseProgram(prog);

   const GLint layer_loc = oglGetUniformLocation(prog, U_LAYER);
   const GLint frame_loc = oglGetUniformLocation(prog, U_FRAME);
   const GLint forvolume_loc = oglGetUniformLocation(prog, U_FORVOLUME);
   const GLint voltex_loc = oglGetUniformLocation(prog, U_VOLTEX);
   const GLint mode_loc = oglGetUniformLocation(prog, U_MODE);
   const GLint time_loc = oglGetUniformLocation(prog, U_TIME);


		glViewport(0, 0, VOLUME_SIZE, VOLUME_SIZE);
			glFinish();

	{
      oglActiveTexture(GL_TEXTURE6);
      glBindTexture(GL_TEXTURE_3D, 7);
      glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
      glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

      int prevnum=0;
      oglUniform1i(forvolume_loc, 2);
      oglUniform1f(layer_loc, 0);
      glClearColor(1.0f, 1.0f, 0.0f, 0.0f);
      glClear(GL_COLOR_BUFFER_BIT);
      oglCopyTexSubImage3D(GL_TEXTURE_3D,0,0,0,0,0,0,VOLUME_SIZE,VOLUME_SIZE);
      glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
      glViewport(0, 0, VOLUME_SIZE, VOLUME_SIZE);
      oglUniform1i(forvolume_loc, 2);
      oglUniform1i(voltex_loc, 6);
      for(int i = 0; i < VOLUME_SIZE; ++i)
      {
         float layer=float(i) / float(VOLUME_SIZE);
         int num=(2000+int(MAX(0.0,layer-0.0)*31000));
         for(int j=prevnum;j<=num;++j)
         {
            oglUniform1f(frame_loc, (float)j);
						glRects(-1,-1,+1,+1);
			glFinish();
            oglCopyTexSubImage3D(GL_TEXTURE_3D,0,0,0,i,0,0,VOLUME_SIZE,VOLUME_SIZE);
            oglUniform1f(layer_loc, layer);
         }
         prevnum=num;
      }
      glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
      glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

      for(int mode=0;mode<6;++mode)
      {
         oglActiveTexture(GL_TEXTURE0+mode);
         glBindTexture(GL_TEXTURE_3D, 1+mode);
         glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
         glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

         oglUniform1i(forvolume_loc, 1);
         oglUniform1i(voltex_loc, 6);
         oglUniform1i(mode_loc, mode);
         for(int i = 0; i < VOLUME_SIZE; ++i)
         {
            float layer=float(i) / float(VOLUME_SIZE);
            oglUniform1f(layer_loc, layer);
						glRects(-1,-1,+1,+1);
			glFinish();
            oglCopyTexSubImage3D(GL_TEXTURE_3D,0,0,0,i,0,0,VOLUME_SIZE,VOLUME_SIZE);
         }

         oglGenerateMipmap(GL_TEXTURE_3D);
         glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
         glTexParameteri(GL_TEXTURE_3D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
      }
	}


    glViewport(0, 0, XRES, YRES);

   oglUniform1i(forvolume_loc, 0);

   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME), 0);
   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME2), 1);
   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME3), 2);
   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME4), 3);
   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME5), 4);
   oglUniform1i(oglGetUniformLocation(prog, U_VOLUME6), 5);
      oglUniform1i(oglGetUniformLocation(prog, U_FSTEX), 6);
   oglUniform1f(oglGetUniformLocation(prog, U_ASPECT_RATIO), float(XRES)/float(YRES));

	Clinkster_GenerateMusic();

	Clinkster_StartMusic();

    do 
    {
static int frame=0;
const float time=Clinkster_GetPosition() / Clinkster_TicksPerSecond;
//const float time = float(frame) / 2.f;
   oglUniform1f(frame_loc, (float)frame++);
   oglUniform1f(time_loc, time);

   int scene=0;


   if(time>60*2+52)
   {
      scene=3;
      oglUniform1f(time_loc, time-(60*2+50));
   }
   else if(time>60*1+46)
   {
      scene=2;
      oglUniform1f(time_loc, time-(60*1+46));
   }
   else if(time>60*1+36)
   {
      scene=1;
      oglUniform1f(time_loc, time-(60*1+36));
   }
   else if(time>60*1+24)
   {
      scene=4;
      oglUniform1f(time_loc, time-(60*1+24));
   }

   oglActiveTexture(GL_TEXTURE6);
  glBindTexture(GL_TEXTURE_3D, 0);
  glBindTexture(GL_TEXTURE_2D, 8);
   switch(scene)
   {
      case 0:
         oglUniform1i(mode_loc, 0);
					glRects(-1,-1,+1,+1);

         glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, 0, 0, XRES, YRES, 0);

         oglUniform1i(mode_loc, 1);
         break;
      case 1:
         oglUniform1i(mode_loc, 2);
         break;
      case 2:
         oglUniform1i(mode_loc, 6);
					glRects(-1,-1,+1,+1);

         glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, 0, 0, XRES, YRES, 0);

         oglUniform1i(mode_loc, 3);
         break;
      case 3:
         oglUniform1i(mode_loc, 7);
					glRects(-1,-1,+1,+1);

         glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, 0, 0, XRES, YRES, 0);

         oglUniform1i(mode_loc, 4);
         break;
      case 4:
         oglUniform1i(mode_loc, 5);
         break;
   }

		glRects(-1,-1,+1,+1);

		glFinish();

//        SwapBuffers( hDC );
        wglSwapLayerBuffers( hDC, WGL_SWAP_MAIN_PLANE ); //SwapBuffers( hDC );

		PeekMessageA(0, 0, 0, 0, PM_REMOVE); // <-- "fake" message handling.

    }while ( !GetAsyncKeyState(VK_ESCAPE) );
    //}while ( !GetAsyncKeyState(VK_ESCAPE) && t<(MZK_DURATION*1000) );
	//} while (MMTime.u.sample < MAX_SAMPLES && !GetAsyncKeyState(VK_ESCAPE));

    #ifdef CLEANDESTROY
    sndPlaySound(0,0);
    ChangeDisplaySettings( 0, 0 );
    ShowCursor(1);
    #endif

    ExitProcess(0);
}
