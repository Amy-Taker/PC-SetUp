#!/usr/bin/env perl
# $ENV{'TEXINPUTS'}='./tex//:' . $ENV{'TEXINPUTS'}; 
$ENV{'BSTINPUTS'}='./sty//:' . $ENV{'BSTINPUTS'};

# $ENVについては'locate texmf.cnf'で変数名称を確認すること
# https://ja.overleaf.com/learn/latex/Questions/I_have_a_lot_of_.cls%2C_.sty%2C_.bst_files%2C_and_I_want_to_put_them_in_a_folder_to_keep_my_project_uncluttered._But_my_project_is_not_finding_them_to_compile_correctly

##-----------------------------------------------------------------------------
## latex options
##-----------------------------------------------------------------------------
$latexargs       = '  -shell-escape  -synctex=1  -file-line-error';
$latexsilentargs = $latexargs. '  -interaction=batchmode';
# -synctex=1 … プレビュー画面からソースコードの該当箇所に移動できるようにします
# -shell-escape … 任意の外部コマンドの実行(mintedのpygmentsなど)
# -halt-on-error … コンパイル中にエラーが発生した場合、コンパイルを終了します
# -interaction=nonstopmode … コンパイル中にエラーが起きても、ユーザーにどう処理するかの指示を求めずにコンパイルを続行します(-interaction=batchmode)
# -file-line-error … TeXファイルの何行目でエラーが発生したかを表示します(https://tex.stackexchange.com/questions/258814/what-is-the-difference-between-interaction-nonstopmode-and-halt-on-error)

$args = $latexargs; # $latexsilentargs or $latexsargs


##-----------------------------------------------------------------------------
## latex
##-----------------------------------------------------------------------------
# ここで指定を行わないと自動保管される(defolt値は変更されず-no-shell-escapeで実行される)
$latex    = 'platex  -synctex=1';
$uplatex  = 'uplatex  -kanji=utf8  -no-guess-input-enc'.$args;
$pdflatex = 'pdflatex'.$args;
$lualatex = 'lualatex'.$args;
$xelatex  = 'xelatex'.$args;

$lualatex_silent_switch = 'lualatex'. $latexsilentargs;
# 実行時の-silentオプションを使用した場合に，コンパイルするコマンドの設定


##-----------------------------------------------------------------------------
## pdf_mode
##-----------------------------------------------------------------------------
# $pdf_mode         = 0; # $latexによりdviファイルを生成する。PDFを出力しない
# $pdf_mode         = 1; # $pdflatexを使ってdviファイルなどを経由せずに直接PDFを作成
# $pdf_mode         = 2; # $latexにより生成されたdviファイルを$dvipsによりpsファイルに変換したあと、$ps2pdfによりPDFを作成
# $pdf_mode         = 3; # $latexによりdviファイルを生成し、$dvipdfによりPDFを作成
$pdf_mode         = 4; # $lualatexにより直接PDFを作成
# $pdf_mode         = 5; # $xelatexによりdviファイルを生成後、$xdvipdfmxによりPDFを作成


##-----------------------------------------------------------------------------
## BiB
##-----------------------------------------------------------------------------
$bibtex    = 'upbibtex';# 'pbibtex';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
# –bblencoding=utf8 … bblファイル（参考文献ファイル）の文字コードをUTF-8にします
# -u … 入力ファイルの文字コードをUTF-8にします
# -U … 出力ファイルの文字コードをUTF-8にします
# –output_safechars … ユニコード文字をLaTeXの命令を使ってエンコードした形で出力させます


##-----------------------------------------------------------------------------
## index
##-----------------------------------------------------------------------------
$makeindex = 'upmendex %O -o %D %S';


##-----------------------------------------------------------------------------
## dvi (lualtex使用のため不活性化)
##-----------------------------------------------------------------------------
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips  = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf.exe %O %S %D';


##-----------------------------------------------------------------------------
# preview
##-----------------------------------------------------------------------------
$pvc_view_file_via_temporary = 0;
# -pvc実行時に残す待避データの保管数

## for Windows-----------------------------------------------------------------------------
if ($^O eq 'MSWin32') { # SumatraPDF を Windowsだとpathが違う気がする
  if (-f 'C:/Program Files/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } elsif (-f 'C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
    $pdf_previewer = '"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
  } else {
    $pdf_previewer = 'SumatraPDF -reuse-instance';
    # $pdf_previewer = 'texworks'; 
  }

## for Linux-----------------------------------------------------------------------------
} elsif ($^O eq 'linux') {
  if (-d '/mnt/c/Windows/') { # for WSL : /mnt/c/Windows のディレクトリがある
    print "=== WSL ===\n";
    if (-f '/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe') {
      $pdf_previewer = '"/mnt/c/Program Files/SumatraPDF/SumatraPDF.exe" -reuse-instance';
    } elsif (-f '/mnt/c/Program Files (x86)/SumatraPDF/SumatraPDF.exe') {
      $pdf_previewer = '"/mnt/c/Program Files (x86)/SumatraPDF/SumatraPDF.exe" -reuse-instance';
    } else {
      $pdf_previewer = 'SumatraPDF -reuse-instance';
    }
  } else {
    print "=== Native Linux ===\n";
    $pdf_previewer = "xdg-open";
    # $pdf_previewer = "start %S";
  }
  # $pdf_previewer = 'evince';
  # $pdf_previewer = "start %S";
  # $pdf_previewer = 'texworks';
  # $pdf_previewer = "xdg-open %S";

## for MacOS-----------------------------------------------------------------------------
} elsif ($^O eq 'darwin') {
  # $dvi_previewer = "open %S";
  # $pdf_previewer = "open %S";
  # $pdf_previewer = "open -ga Preview %S";
  $pdf_previewer = 'open -ga /Applications/Skim.app';
  
  # $pdf_update_method = 4;
  # $pdf_update_command = 'open -ga /Applications/Skim.app';
  # $pdf_update_command = "open -ga Preview %S";  
  # $pdf_previewer = 'open -ga /Applications/Skim.app';

## for other OS-----------------------------------------------------------------------------
} else {
#   $dvi_previewer = "start %S";
  $pdf_previewer = "start %S";
}
# $pdf_previewer = "start xpdf -remote %R %O %S"; 

##-----------------------------------------------------------------------------
# $pdf_update_method = 2; # $pdf_update_signalでupdate
# $pdf_update_signal = ;

# $pdf_update_method = 3; # $pdf_updateをしない(Note:WindowsのAcrobatはPDFをロックする)

# $pdf_update_method = 4; # $pdf_update_commandでupdate
# $pdf_update_command = "xpdf -remote %R -reload";


## ,.への置換コマンド(https://qiita.com/yudai-nkt/items/900a5f1c87689e033ff3)
# $pdf_update_method = 4;
# $pdf_update_command = "find . -type f -name '*.tex' -print0 | xargs -0 sed -i '' -e 's/，/、/g' -e 's/．/。/g'";