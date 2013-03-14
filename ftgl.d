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

module dftgl.ftgl;

extern(System):

/* Floating point types used by the library */
alias FTGL_DOUBLE = double;
alias FTGL_FLOAT = float;

enum FTGL_RENDER_FRONT = 0x0001;
enum FTGL_RENDER_BACK = 0x0002;
enum FTGL_RENDER_SIDE = 0x0004;
enum FTGL_RENDER_ALL = 0xffff;

enum FTGL_ALIGN_LEFT = 0;
enum FTGL_ALIGN_CENTER = 1;
enum FTGL_ALIGN_RIGHT = 2;
enum FTGL_ALIGN_JUSTIFY = 3;

public import dftgl.FTGlyph;
public import dftgl.FTBitmapGlyph;
public import dftgl.FTExtrdGlyph;
public import dftgl.FTOutlineGlyph;
public import dftgl.FTPixmapGlyph;
public import dftgl.FTPolyGlyph;
public import dftgl.FTTextureGlyph;

public import dftgl.FTFont;
public import dftgl.FTGLBitmapFont;
public import dftgl.FTBufferFont;
public import dftgl.FTGLExtrdFont;
public import dftgl.FTGLOutlineFont;
public import dftgl.FTGLPixmapFont;
public import dftgl.FTGLPolygonFont;
public import dftgl.FTGLTextureFont;

public import dftgl.FTLayout;
public import dftgl.FTSimpleLayout;
