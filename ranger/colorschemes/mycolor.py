# Catppuccin Mocha colorscheme for ranger
# Based on https://github.com/catppuccin/ranger

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black, blue, cyan, green, magenta, red, white, yellow, default,
    normal, bold, reverse,
    default_colors,
)


class Default(ColorScheme):
    # Catppuccin Mocha: surface0 = #313244
    progress_bar_color = 236

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                # red = #f38ba8
                fg = 211
                bg = default
            if context.border:
                # overlay0 = #6c7086
                fg = 242
            if context.media:
                if context.image:
                    # yellow = #f9e2af
                    fg = 223
                else:
                    # pink = #f5c2e7
                    fg = 218
            if context.container:
                # peach = #fab387
                fg = 216
            if context.directory:
                attr |= bold
                # blue = #89b4fa
                fg = 111
            elif context.executable and not \
                    any((context.media, context.container,
                         context.fifo, context.socket)):
                # green = #a6e3a1
                fg = 150
            if context.socket:
                # mauve = #cba6f7
                fg = 183
                attr |= bold
            if context.fifo or context.device:
                # yellow = #f9e2af
                fg = 223
                if context.device:
                    attr |= bold
            if context.link:
                # cyan = #94e2d5 if good, else maroon = #eba0ac
                fg = 115 if context.good else 217
            if context.tag_marker and not context.selected:
                attr |= bold
                # red = #f38ba8
                fg = 211
            if not context.selected and (context.cut or context.copied):
                # surface2 = #585b70
                fg = 240
                attr |= bold
            if context.main_column:
                if context.selected:
                    attr |= bold
                if context.marked:
                    attr |= bold
                    # yellow = #f9e2af
                    fg = 223
            if context.badinfo:
                if attr & reverse:
                    # red = #f38ba8
                    bg = 211
                else:
                    fg = 211

            if context.inactive_pane:
                # subtext0 = #a6adc8
                fg = 146

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                # red/green
                fg = 211 if context.bad else 150
            elif context.directory:
                # blue = #89b4fa
                fg = 111
            elif context.tab:
                if context.good:
                    # base = #1e1e2e, green = #a6e3a1
                    fg = 234
                    bg = 150
            elif context.link:
                # cyan = #94e2d5
                fg = 115

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    # teal = #94e2d5
                    fg = 115
                elif context.bad:
                    # red = #f38ba8
                    fg = 211
            if context.marked:
                attr |= bold | reverse
                # yellow = #f9e2af
                fg = 223
            if context.message:
                if context.bad:
                    attr |= bold
                    # red = #f38ba8
                    fg = 211
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                # blue = #89b4fa
                fg = 111
                attr &= ~bold
            if context.vcscommit:
                # yellow = #f9e2af
                fg = 223
                attr &= ~bold
            if context.vcsdate:
                # cyan = #94e2d5
                fg = 115
                attr &= ~bold

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                # blue = #89b4fa
                fg = 111

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                # mauve = #cba6f7
                fg = 183
            elif context.vcschanged:
                # peach = #fab387
                fg = 216
            elif context.vcsunknown:
                # red = #f38ba8
                fg = 211
            elif context.vcsstaged:
                # green = #a6e3a1
                fg = 150
            elif context.vcssync:
                # green = #a6e3a1
                fg = 150
            elif context.vcsignored:
                # overlay0 = #6c7086
                fg = 242

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync or context.vcsnone:
                # green = #a6e3a1
                fg = 150
            elif context.vcsbehind:
                # red = #f38ba8
                fg = 211
            elif context.vcsahead:
                # blue = #89b4fa
                fg = 111
            elif context.vcsdiverged:
                # mauve = #cba6f7
                fg = 183
            elif context.vcsunknown:
                # red = #f38ba8
                fg = 211

        return fg, bg, attr
