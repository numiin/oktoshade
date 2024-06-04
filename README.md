# ![oktoshade](themes/lost-in-wonder/preview.svg)

Designed for _terminals_ with 256-indexed color palette support

## Concept

Theme is a sequence of octets and retains ANSI octal color semantics with no special interpretation within an octet.
How the theme colors are actually applied in applications is a user preference.

In other words, theme does not impose any contextual meaning to colors, i.e. whether a particular color is used for _keywords_ or _strings_ etc is beyond the scope of this project.

Guidelines:
* Respect ANSI color semantics in any octet:
  * 1st: Shaded, darker than the rest of the octet
  * 2nd-8th: Accents of `red` `green` `yellow` `blue` `magenta` `cyan` `white`
* Respect ANSI convention of _octet 2_ being brighter than _octet 1_

* Stack any number of octets on top of the basic 2 _octets_, for example:
  * _octet_ 1 [0-7]: _normal_
  * _octet_ 2 [8-15]: _bright_
  * _octet_ 3 [16-23]: _background_
  * _octet_ 4 [24-31]: _shaded_ _normal_ (or _bright background_)
  * _octet_ 5 [32-39]: _accented normal_
  * _octet_ 6 [40-48]: _accented bright_

Here _octets_ (3,4) (5,6) typically replicate the relation between _octet 1_ and _octet 2_, i.e. that [2] is brighter than [1], but that is not a strict requirement when building custom octal themes.

## Install

```bash
git clone https://github.com/numiin/oktoshade
cd oktoshade
```

### Build

Requirements:
* [pastel](https://github.com/sharkdp/pastel) - a command-line tool used for converting `RGB` to `HSL` to generate shades and tints.

#### For _terminals_ with only basic 16 color configuration

##### `iTerm2`

```bash
$ ./target/iTerm2.sh <name> > /path/to/theme.itermcolors
```

In _iTerm2_ go to _Settings > Profiles_, select a profile of choice (or create new), open _Colors_ tab on the right, select _Import_ in _Color Presets_ and navigate to `/path/to/theme.itermcolors`

##### Setup ANSI colors (from _index_ 16)

```bash
$ ./target/ansi.sh <theme name> > ~/.bash_theme
$ echo '~/.bash_theme' >> ~/.bashrc
```

#### For _terminals_ with 256 indexed palette configuration

##### `alacritty`

```bash
$ ./target/alacritty.sh <theme name>
```

Paste the output into `alacritty.toml`.

##### `foot`

```bash
$ ./target/foot.sh <theme name>
```

Paste the output into `foot.ini`.

### Preview

#### Colored ANSI table

Would print an equivalent of the preview directly in the _terminal_ emitting _RGB_ _ANSI_ escape codes.
This is an easy way to get a sense of the actual look without the need to install a theme.

```bash
./preview/colored-ansi <theme name>
```

This can also be a way to incrementally develop new themes or tweak existing ones.

#### Indexed ANSI table

Would generate same output as the method above but by using _ANSI_ indexed color palette.
So, naturally, for this to work you have to already have a theme installed.

```bash
./preview/indexed-ansi <theme name>
```

#### SVG table

Each theme under `./themes/<theme>` must have a _README_ which would showcase a preview of theme's shades, accents and ways in which background and foreground colors would typically be used.
