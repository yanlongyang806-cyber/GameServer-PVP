#ifndef EXPAT_H_3E5A2DDC
#define EXPAT_H_3E5A2DDC 1

#include "expat_external.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declaration. */
typedef struct XML_ParserStruct *XML_Parser;

XML_Parser XML_ParserCreate(const XML_Char *encoding);

void XML_ParserFree(XML_Parser parser);

int XML_Parse(XML_Parser parser, const char *s, int len, int isFinal);

#ifdef __cplusplus
}
#endif

#endif /* expat.h */
