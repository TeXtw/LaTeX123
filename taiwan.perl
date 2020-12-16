# taiwan.perl for taiwan babel, inspired heavily by german.perl
#
# This file is for LaTeX2HTML to display Traditional Chinese caption.
# You can put it on the working directory, or put it on the path
# where kpathsea can find it.
#
# taiwan.sty is an empty file, it's necessary for compiling correctly,
# don't delete it.
#
# by Edward G.J. Lee <edt1023@info.sayya.org> 2003/01/03
#
# $Id: taiwan.perl,v 1.1 2004/03/03 13:22:52 edt1023 Exp $
#

package taiwan;

print "\nTaiwan style interface for LaTeX2HTML, revised: 03 Jan 2003\n";

sub main'taiwan_translation {
    local($_) = @_;
s/;SPMquot;\s*('|`|;SPMlt;|;SPMgt;|\\|-|;SPMquot;|=|\|)/&get_taiwan_specials($1)/geo;
    $_;
}

sub get_taiwan_specials {
    $taiwan_specials{@_[0]}
}

%taiwan_specials = (
    '\''       => "``",
    "\`"       => ",,",
    ';SPMlt;'  => "&laquo;",
    ';SPMgt;'  => "&raquo;",
    '\\'       => "",
    '-'        => "-",
    ';SPMquot;'=> "",
    '='        => "-",
    '|'        => ""
);


package main;

if (defined &addto_languages) { &addto_languages('taiwan') };

sub taiwan_titles {
    $toc_title = "目錄";
    $lof_title = "圖目錄";
    $lot_title = "表目錄";
    $idx_title = "索引";
    $ref_title = "參考資料";
    $bib_title = "參考資料";
    $abs_title = "摘要";
    $app_title = "附錄";
    $pre_title = "前言";
    $foot_title = "腳註";
    $thm_title = "定理";
    $fig_name = "圖";
    $tab_name = "表";
    $prf_name = "證明";
    $date_name = "日期";
    $page_name = "頁";
#  Sectioning-level titles
    $part_name = "部";
    $chapter_name = "章";
    $section_name = "節";
    $subsection_name = "小節";
#    $subsubsection_name = "";
#    $paragraph_name = "";
#  Misc. strings
    $child_name = "";
    $info_title = "關於這份文件……";
    $also_name = "";
    $see_name = "";
#  names in navigation panels
    $next_name = "【次頁】";
    $up_name = "【封面頁】";
    $prev_name = "【前頁】";
    $group_name = "";
#  mail fields
    $encl_name = "";
    $headto_name = "";
    $cc_name = "";
    @Month = ('', "一月", "二月", "三月", "四月", "五月", "六月",
             "七月", "八月", "九月", "十月", "十一月", "十二月");
#    $GENERIC_WORDS = "";
}


sub taiwan_today {
    local($today) = &get_date();
    $today =~ s|(\d+)/0?(\d+)/|$2. $Month[$1] |;
    join('',$today,$_[0]);
}



# use'em
&taiwan_titles;
$default_language = 'taiwan';
$TITLES_LANGUAGE = 'taiwan';
$taiwan_encoding = 'big5';

1;
