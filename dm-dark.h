/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
/* static const char *colors[SchemeLast][2] = { */
/*           	/\*     fg         bg       *\/ */
/* 	[SchemeNorm] = { "#000000", "#deb887" }, */
/* 	[SchemeSel] = { "#303030", "#ffe4b5" }, */
/* 	[SchemeOut] = { "#000000", "#ffffff" }, */
/* }; */

static const char *colors[SchemeLast][2] = {
          	/*     fg         bg       */
	[SchemeNorm] = { "#ffffff", "#333333" },
	[SchemeSel] = { "#ffffff", "#444444" },
	[SchemeOut] = { "#000000", "#ffffff" },
};


/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 1;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
