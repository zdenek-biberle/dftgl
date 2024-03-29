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

module dftgl.FTTextureGlyph;

import dfreetype.ft;
import dftgl.FTGlyph;

extern(System):

/**
 * Create a specialisation of FTGLglyph for creating pixmaps.
 *
 * @param glyph The Freetype glyph to be processed.
 * @param id  The id of the texture that this glyph will be drawn in.
 * @param xOffset  The x offset into the parent texture to draw this glyph.
 * @param yOffset  The y offset into the parent texture to draw this glyph.
 * @param width  The width of the parent texture.
 * @param height  The height (number of rows) of the parent texture.
 * @return  An FTGLglyph* object.
 */
FTGLglyph *ftglCreateTextureGlyph(FT_GlyphSlot glyph, int id,
                                              int xOffset, int yOffset,
                                              int width, int height);

