let
  ttf_ms_win10 = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "arial.ttf"      "arialbd.ttf"    "ariali.ttf"     "arialbi.ttf"    # Arial
    "ariblk.ttf"                                                        # Arial Black
    "bahnschrift.ttf"                                                   # Bahnschrift
    "calibri.ttf"    "calibrib.ttf"   "calibrii.ttf"   "calibriz.ttf"   # Calibri
    "calibril.ttf"                    "calibrili.ttf"                   # Calibri Light
    "cambria.ttc"    "cambriab.ttf"   "cambriai.ttf"   "cambriaz.ttf"   # Cambria
    "Candara.ttf"    "Candarab.ttf"   "Candarai.ttf"   "Candaraz.ttf"   # Candara
    "Candaral.ttf"                    "Candarali.ttf"                   # Candara Light
    "comic.ttf"      "comicbd.ttf"    "comici.ttf"     "comicz.ttf"     # Comic Sans MS
    "consola.ttf"    "consolab.ttf"   "consolai.ttf"   "consolaz.ttf"   # Consolas
    "constan.ttf"    "constanb.ttf"   "constani.ttf"   "constanz.ttf"   # Constantia
    "cour.ttf"       "courbd.ttf"     "couri.ttf"      "courbi.ttf"     # Courier New
    "corbel.ttf"     "corbelb.ttf"    "corbeli.ttf"    "corbelz.ttf"    # Corbel
    "corbell.ttf"                     "corbelli.ttf"                    # Corbel Light
    "framd.ttf"                       "framdit.ttf"                     # Franklin Gothic Medium
    "Gabriola.ttf"                                                      # Gabriola
    "georgia.ttf"    "georgiab.ttf"   "georgiai.ttf"   "georgiaz.ttf"   # Georgia
    "holomdl2.ttf"                                                      # HoloLens MDL2 Assets
    "impact.ttf"                                                        # Impact
    "Inkfree.ttf"                                                       # Ink Free
    "lucon.ttf"                                                         # Lucida Console
    "l_10646.ttf"                                                       # Lucida Sans Unicode
    "marlett.ttf"                                                       # Marlett
    "micross.ttf"                                                       # Microsoft Sans Serifc
    "pala.ttf"       "palab.ttf"      "palai.ttf"      "palabi.ttf"     # Palatino Linotype
    "segoepr.ttf"    "segoeprb.ttf"                                     # Segoe Print
    "segoesc.ttf"    "segoescb.ttf"                                     # Segoe Script
    "segmdl2.ttf"                                                       # Segoe MDL2 Assets
    "segoeui.ttf"    "segoeuib.ttf"   "segoeuii.ttf"   "segoeuiz.ttf"   # Segoe UI
    "seguibl.ttf"                     "seguibli.ttf"                    # Segoe UI Black
    "seguiemj.ttf"                                                      # Segoe UI Emoji
    "seguihis.ttf"                                                      # Segoe UI Historic
    "segoeuil.ttf"                    "seguili.ttf"                     # Segoe UI Light
    "seguisb.ttf"                     "seguisbi.ttf"                    # Segoe UI Semibold
    "segoeuisl.ttf"                   "seguisli.ttf"                    # Segoe UI Semilight
    "seguisym.ttf"                                                      # Segoe UI Symbol
    "Sitka.ttc"      "SitkaB.ttc"     "SitkaI.ttc"     "SitkaZ.ttc"     # Sitka
    "sylfaen.ttf"                                                       # Sylfaen
    "symbol.ttf"                                                        # Symbol
    "tahoma.ttf"     "tahomabd.ttf"                                     # Tahoma
    "times.ttf"      "timesbd.ttf"    "timesi.ttf"     "timesbi.ttf"    # Times New Roman
    "trebuc.ttf"     "trebucbd.ttf"   "trebucit.ttf"   "trebucbi.ttf"   # Trebuchet MS
    "verdana.ttf"    "verdanab.ttf"   "verdanai.ttf"   "verdanaz.ttf"   # Verdana
    "webdings.ttf"                                                      # Webdings
    "wingding.ttf"                                                      # Wingdings
  ];
  ttf_ms_win10_japanese = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "msgothic.ttc"                                                      # MS Gothic
    "YuGothR.ttc"   "YuGothB.ttc"                                       # Yu Gothic
    "YuGothM.ttc"                                                       # Yu Gothic Medium
    "YuGothL.ttc"                                                       # Yu Gothic Light
  ];
  ttf-ms-win10_korean = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "malgun.ttf"     "malgunbd.ttf"                                     # Malgun Gothic
    "malgunsl.ttf"                                                      # Malgun Gothic Semilight
  ];
  ttf_ms_win10_sea = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "javatext.ttf"                                                      # Javanese Text
    "himalaya.ttf"                                                      # Microsoft Himalaya
    "ntailu.ttf"     "ntailub.ttf"                                      # Microsoft New Tai Lue
    "phagspa.ttf"    "phagspab.ttf"                                     # Microsoft PhagsPa
    "taile.ttf"      "taileb.ttf"                                       # Microsoft Tai Le
    "msyi.ttf"                                                          # Microsoft Yi Baiti
    "monbaiti.ttf"                                                      # Mongolian Baiti
    "mmrtext.ttf"    "mmrtextb.ttf"                                     # Myanmar Text
    "Nirmala.ttf"    "NirmalaB.ttf"                                     # Nirmala UI
    "NirmalaS.ttf"                                                      # Nirmala UI Semilight
  ];
  ttf_ms_win10_thai = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "LeelawUI.ttf"   "LeelaUIb.ttf"                                     # Leelawadee UI
    "LeelUIsl.ttf"                                                      # Leelawadee UI Semilight
  ];
  ttf_ms_win10_zh_cn = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "simsun.ttc"                                                        # NSimSun
    "simsunb.ttf"                                                       # SimSun-ExtB
    "msyh.ttc"       "msyhbd.ttc"                                       # Microsoft YaHei
    "msyhl.ttc"                                                         # Microsoft YaHei Light
  ];
  ttf_ms_win10_zh_tw = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "msjh.ttc"       "msjhbd.ttc"                                       # Microsoft JhengHei
    "msjhl.ttc"                                                         # Microsoft JhengHei Light
    "mingliub.ttc"                                                      # MingLiU_HKSCS-ExtB
  ];
  ttf_ms_win10_other = [
    #################################################################################################
    #  Normal           Bold            Italic          Bold+Italic     #  Full name                #
    #################################################################################################
    "ebrima.ttf"     "ebrimabd.ttf"                                     # Ebrima
    "gadugi.ttf"     "gadugib.ttf"                                      # Gadugi
    "mvboli.ttf"                                                        # MV Boli
  ];
  files = 
    ttf_ms_win10 ++
    ttf_ms_win10_japanese ++
    ttf-ms-win10_korean ++
    ttf_ms_win10_sea ++
    ttf_ms_win10_thai ++
    ttf_ms_win10_zh_cn ++
    ttf_ms_win10_zh_tw;
in
  files
