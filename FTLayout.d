/*
 * FTGL - OpenGL font library
 *
 * Copyright (c) 2001-2004 Henry Maddocks <ftgl@opengl.geek.nz>
 * Copyright (c) 2008 Sam Hocevar <sam@zoy.org>
 * Copyright (c) 2008 Sean Morrison <learner@brlcad.org>
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
 
module dftgl.FTLayout;

import dfreetype.ft;

extern(System):

/**
 * FTGLlayout is the interface for layout managers that render text.
 */
struct FTGLlayout;

/**
 * Destroy an FTGL layout object.
 *
 * @param layout  An FTGLlayout* object.
 */
void ftglDestroyLayout(FTGLlayout* layout);

/**
 * Get the bounding box for a string.
 *
 * @param layout  An FTGLlayout* object.
 * @param string  A char buffer
 * @param bounds  An array of 6 float values where the bounding box's lower
 *                left near and upper right far 3D coordinates will be stored.
 */
void ftglGetLayoutBBox(FTGLlayout *layout, const(char)* string,
                                   float* bounds);

/**
 * Render a string of characters.
 *
 * @param layout  An FTGLlayout* object.
 * @param string  Char string to be output.
 * @param mode  Render mode to display.
 */
void ftglRenderLayout(FTGLlayout *layout, const(char) *string,
                                  int mode);

/**
 * Query a layout for errors.
 *
 * @param layout  An FTGLlayout* object.
 * @return  The current error code.
 */
FT_Error ftglGetLayoutError(FTGLlayout* layout);
