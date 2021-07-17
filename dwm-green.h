/* See LICENSE file for copyright and license details. */

/* appearance-green */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 20;       /* vert inner gap between windows */
static const unsigned int gappoh    = 40;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 40;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int user_bh            = 53;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Agave Nerd Font:size=15" };
static const char dmenufont[]       = "Agave Nerd Font:size=15";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#3cb371";  /* "#ffe4b5"; */
static const char col_gray3[]       = "#000000";
static const char col_gray4[]       = "#ffffff";
static const char col_cyan[]        = "#66cbaa"; /* "#deb887"; */

/* static const char col_gray1[]       = "#222222"; */
/* static const char col_gray2[]       = "#ffe4b5"; */
/* static const char col_gray3[]       = "#000000"; */
/* static const char col_gray4[]       = "#ffffff"; */
/* static const char col_cyan[]        = "#deb887"; */


static const char col_border[]      = "#bbbbbb";

static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray2, col_gray2 },
	[SchemeSel]  = { col_gray3, col_cyan, col_border  },
	[SchemeHid]  = { col_gray4, col_cyan, col_cyan  },
};

static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

static const Bool viewontag         = True;     /* Switch view on tag switch */

/* tagging */
//static const char *tags[] = { "\uf120",  "\uf121", "\uf7ae", "\ue727", "\ue62e", "\uf684", "\uf537", "\uf251", "\uf034"  };
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "-",      tile },    /* first entry is default */
	{ "*",      NULL },    /* no layout function means floating behavior */
	{ "",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "/home/ren/scripts/dmenu.sh", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *clipmenu[] = { "/home/ren/scripts/clipmenu.sh", NULL };
static const char *upvol[] = { "/home/ren/scripts/vol-up.sh", NULL };
static const char *downvol[] = { "/home/ren/scripts/vol-down.sh", NULL };
static const char *mutevol[] = { "/home/ren/scripts/vol-toggle.sh", NULL };
static const char *backlightup[] = { "/home/ren/scripts/backlight-up.sh", NULL };
static const char *backlightdown[] = { "/home/ren/scripts/backlight-down.sh", NULL };
static const char *dpdf[] = { "/home/ren/scripts/dmenu-pdf.sh", NULL };
static const char *wal[] = { "/home/ren/scripts/wp-change.sh", NULL };
static const char *kp[] = { "/home/ren/scripts/dmenu-kill-process", NULL };
static const char *editor[] = { "/home/ren/scripts/dmenu-open.sh", NULL };
static const char *chbar[] = { "/home/ren/scripts/change-bar.sh", NULL };
static const char *sp[] = { "/home/ren/scripts/dmenu-sp.sh", NULL };
static const char *dweb[] = {"/home/ren/scripts/dmenu-websearch", NULL};
static const char scratchpadname[] = "scratchpad";
static const char *scratchpadcmd[] = { "st", "-t", scratchpadname, "-g", "120x35", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
        { MODKEY,                       XK_y,      spawn,          {.v = clipmenu}  },
        { MODKEY,                       XK_r,      spawn,          {.v = editor}  },
        { MODKEY,                       XK_q,      spawn,          {.v = sp}  },
        { MODKEY,                       XK_a,      spawn,          {.v = downvol} },
        { MODKEY,                       XK_s,      spawn,          {.v = upvol} },
        { MODKEY|ShiftMask,             XK_z,      spawn,          {.v = mutevol} },
        { MODKEY|ShiftMask,             XK_a,      spawn,          {.v = backlightdown} },
        { MODKEY|ShiftMask,             XK_s,      spawn,          {.v = backlightup} },
        { MODKEY|ControlMask,           XK_a,      spawn,          {.v = chbar} },
        { MODKEY,                       XK_e,      spawn,          {.v = dpdf} },
        { MODKEY,                       XK_u,      spawn,          {.v = kp} },
        { MODKEY,                       XK_w,      spawn,          {.v = dweb} },
        { MODKEY|ShiftMask,             XK_w,      spawn,          {.v = wal} },
	{ MODKEY,                       XK_g,      togglescratch,  {.v = scratchpadcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|Mod1Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod1Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod1Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_x,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_z,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_x,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_z,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod1Mask,              XK_x,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_z,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_x,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_z,      incrovgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_Return,       zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_f,      fullscreen,     {0} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ControlMask,           XK_j,      moveresize,     {.v = "0x 25y 0w 0h" } },
	{ MODKEY|ControlMask,           XK_k,      moveresize,     {.v = "0x -25y 0w 0h" } },
	{ MODKEY|ControlMask,           XK_l,      moveresize,     {.v = "25x 0y 0w 0h" } },
	{ MODKEY|ControlMask,           XK_h,      moveresize,     {.v = "-25x 0y 0w 0h" } },
	{ MODKEY|ControlMask,           XK_y,      moveresize,     {.v = "0x 0y 0w 25h" } },
	{ MODKEY|ControlMask,           XK_u,      moveresize,     {.v = "0x 0y 0w -25h" } },
	{ MODKEY|ControlMask,           XK_i,      moveresize,     {.v = "0x 0y 25w 0h" } },
	{ MODKEY|ControlMask,           XK_o,      moveresize,     {.v = "0x 0y -25w 0h" } },
	{ MODKEY|ControlMask,           XK_n,      moveresizeedge, {.v = "t"} },
	{ MODKEY|ControlMask,           XK_m,      moveresizeedge, {.v = "b"} },
	{ MODKEY|ControlMask,           XK_v,      moveresizeedge, {.v = "l"} },
	{ MODKEY|ControlMask,           XK_b,      moveresizeedge, {.v = "r"} },
	{ MODKEY|ControlMask|ShiftMask, XK_j,      moveresizeedge, {.v = "T"} },
	{ MODKEY|ControlMask|ShiftMask, XK_k,      moveresizeedge, {.v = "B"} },
	{ MODKEY|ControlMask|ShiftMask, XK_h,      moveresizeedge, {.v = "L"} },
	{ MODKEY|ControlMask|ShiftMask, XK_l,      moveresizeedge, {.v = "R"} },
        { MODKEY|ControlMask,           XK_d,      togglewin,      {.ui = ~0 } },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ControlMask,           XK_q,      quit,           {0} },
};

/* button definitions */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button1,        togglewin,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

