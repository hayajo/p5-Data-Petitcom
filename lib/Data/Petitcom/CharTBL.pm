package Data::Petitcom::CharTBL;

use strict;
use warnings;
use utf8;

use parent qw { Exporter };
our @EXPORT    = qw{};
our @EXPORT_OK = qw{ load_char dump_char };

use constant GRAPHIC_CHAR => [
    [   0, "　" ], [   1, "А" ], [   2, "Б" ], [   3, "В" ], [   4, "Г" ], [   5, "Д" ], [   6, "Е" ], [   7, "Ё" ],
    [   8, "Ж" ], [   9, "З" ], [  10, "И" ], [  11, "Й" ], [  12, "К" ], [  13, "\n" ], [  14, "М" ], [  15, "Н" ],
    [  16, "♪" ], [  17, "О" ], [  18, "н" ], [  19, "П" ], [  20, "Р" ], [  21, "С" ], [  22, "Т" ], [  23, "У" ],
    [  24, "Ф" ], [  25, "Х" ], [  26, "◎" ], [  27, "Ц" ], [  28, "→" ], [  29, "←" ], [  30, "↑" ], [  31, "↓" ],
    [ 128, "◇" ], [ 129, "━" ], [ 130, "┃" ], [ 131, "┏" ], [ 132, "┓" ], [ 133, "┛" ], [ 134, "┗" ], [ 135, "┣" ],
    [ 136, "┳" ], [ 137, "┫" ], [ 138, "┻" ], [ 139, "╋" ], [ 140, "┠" ], [ 141, "┯" ], [ 142, "┨" ], [ 143, "┷" ],
    [ 144, "┴" ], [ 145, "┬" ], [ 146, "├" ], [ 147, "┼" ], [ 148, "┤" ], [ 149, "─" ], [ 150, "│" ], [ 151, "┿" ],
    [ 152, "┌" ], [ 153, "┐" ], [ 154, "└" ], [ 155, "┘" ], [ 156, "┝" ], [ 157, "┰" ], [ 158, "┥" ], [ 159, "┸" ],
    [ 224, "■" ], [ 225, "●" ], [ 226, "▲" ], [ 227, "▼" ], [ 228, "□" ], [ 229, "○" ], [ 230, "△" ], [ 231, "▽" ],
    [ 232, "Ч" ], [ 233, "Ш" ], [ 234, "Щ" ], [ 235, "Ъ" ], [ 236, "Ы" ], [ 237, "Ь" ], [ 238, "Э" ], [ 239, "Ю" ],
    [ 240, "Я" ], [ 241, "а" ], [ 242, "б" ], [ 243, "в" ], [ 244, "г" ], [ 245, "д" ], [ 246, "е" ], [ 247, "ё" ],
    [ 248, "ж" ], [ 249, "з" ], [ 250, "и" ], [ 251, "й" ], [ 252, "к" ], [ 253, "л" ], [ 254, "м" ], [ 255, "╂" ]
];

use Encode;
my $enc = Encode::find_encoding('cp932');

sub load_char {
    my $byte = shift;
    my $dec_code = unpack "C", $byte;
    for my $tpl ( @{ GRAPHIC_CHAR() } ) {
        return $tpl->[1] if ( $tpl->[0] == $dec_code );
    }
    return $enc->decode($byte);
}

sub dump_char {
    my $char = shift;
    for my $tpl ( @{ GRAPHIC_CHAR() } ) {
        return pack( "C*", $tpl->[0] ) if ( $char eq $tpl->[1] );
    }
    return $enc->encode($char);
}

1;
