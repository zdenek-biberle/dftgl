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
 
module dftgl.FTFont;

import dfreetype.ft;
import dftgl.FTGlyph;

extern(System):

/**
 * FTGLfont is the public interface for the FTGL library.
 *
 * It is good practice after using these functions to test the error
 * code returned. <code>FT_Error Error()</code>. Check the freetype file
 * fterrdef.h for error definitions.
 */
struct FTGLfont;

/**
 * Create a custom FTGL font object.
 *
 * @param fontFilePath  The font file name.
 * @param data  A pointer to private data that will be passed to callbacks.
 * @param makeglyphCallback  A glyph-making callback function.
 * @return  An FTGLfont* object.
 */ 
FTGLfont* ftglCreateCustomFont( const(char)* fontFilePath, void* data,
                                FTGLglyph* function(FT_GlyphSlot, void*) makeglyphCallback);   

/**
 * Destroy an FTGL font object.
 *
 * @param font  An FTGLfont* object.
 */
void ftglDestroyFont(FTGLfont* font);

/**
 * Attach auxilliary file to font e.g. font metrics.
 *
 * Note: not all font formats implement this function.
 *
 * @param font  An FTGLfont* object.
 * @param path  Auxilliary font file path.
 * @return  1 if file has been attached successfully.
 */
int ftglAttachFile(FTGLfont* font, const(char)* path);

/**
 * Attach auxilliary data to font, e.g. font metrics, from memory.
 *
 * Note: not all font formats implement this function.
 *
 * @param font  An FTGLfont* object.
 * @param data  The in-memory buffer.
 * @param size  The length of the buffer in bytes.
 * @return  1 if file has been attached successfully.
 */
int ftglAttachData(FTGLfont* font, const(ubyte) * data,
                               size_t size);

/**
 * Set the character map for the face.
 *
 * @param font  An FTGLfont* object.
 * @param encoding  Freetype enumerate for char map code.
 * @return  1 if charmap was valid and set correctly.
 */
int ftglSetFontCharMap(FTGLfont* font, FT_Encoding encoding);

/**
 * Get the number of character maps in this face.
 *
 * @param font  An FTGLfont* object.
 * @return character map count.
 */
uint ftglGetFontCharMapCount(FTGLfont* font);

/**
 * Get a list of character maps in this face.
 *
 * @param font  An FTGLfont* object.
 * @return pointer to the first encoding.
 */
FT_Encoding* ftglGetFontCharMapList(FTGLfont* font);

/**
 * Set the char size for the current face.
 *
 * @param font  An FTGLfont* object.
 * @param size  The face size in points (1/72 inch).
 * @param res  The resolution of the target device, or 0 to use the default
 *             value of 72.
 * @return  1 if size was set correctly.
 */
int ftglSetFontFaceSize(FTGLfont* font, uint size,
                                    uint res);

/**
 * Get the current face size in points (1/72 inch).
 *
 * @param font  An FTGLfont* object.
 * @return face size
 */
uint ftglGetFontFaceSize(FTGLfont* font);

/**
 * Set the extrusion distance for the font. Only implemented by
 * FTExtrudeFont.
 *
 * @param font  An FTGLfont* object.
 * @param depth  The extrusion distance.
 */
void ftglSetFontDepth(FTGLfont* font, float depth);

/**
 * Set the outset distance for the font. Only FTOutlineFont, FTPolygonFont
 * and FTExtrudeFont implement front outset. Only FTExtrudeFont implements
 * back outset.
 *
 * @param font  An FTGLfont* object.
 * @param front  The front outset distance.
 * @param back  The back outset distance.
 */
void ftglSetFontOutset(FTGLfont* font, float front, float back);

/**
 * Enable or disable the use of Display Lists inside FTGL.
 *
 * @param font  An FTGLfont* object.
 * @param useList  1 turns ON display lists.
 *                 0 turns OFF display lists.
 */
void ftglSetFontDisplayList(FTGLfont* font, int useList);

/**
 * Get the global ascender height for the face.
 *
 * @param font  An FTGLfont* object.
 * @return  Ascender height
 */
float ftglGetFontAscender(FTGLfont* font);

/**
 * Gets the global descender height for the face.
 *
 * @param font  An FTGLfont* object.
 * @return  Descender height
 */
float ftglGetFontDescender(FTGLfont* font);

/**
 * Gets the line spacing for the font.
 *
 * @param font  An FTGLfont* object.
 * @return  Line height
 */
float ftglGetFontLineHeight(FTGLfont* font);

/**
 * Get the bounding box for a string.
 *
 * @param font  An FTGLfont* object.
 * @param string  A char buffer
 * @param len  The length of the string. If < 0 then all characters will be
 *             checked until a null character is encountered (optional).
 * @param bounds  An array of 6 float values where the bounding box's lower
 *                left near and upper right far 3D coordinates will be stored.
 */
void ftglGetFontBBox(FTGLfont* font, const(char) *string,
                                 int len, float bounds[6]);

/**
 * Get the advance width for a string.
 *
 * @param font  An FTGLfont* object.
 * @param string  A char string.
 * @return  Advance width
 */
float ftglGetFontAdvance(FTGLfont* font, const(char) *string);

/**
 * Render a string of characters.
 *
 * @param font  An FTGLfont* object.
 * @param string  Char string to be output.
 * @param mode  Render mode to display.
 */
void ftglRenderFont(FTGLfont* font, const(char) *string, int mode);

/**
 * Query a font for errors.
 *
 * @param font  An FTGLfont* object.
 * @return  The current error code.
 */
FT_Error ftglGetFontError(FTGLfont* font);
