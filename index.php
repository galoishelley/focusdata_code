<!--v1.3-->
<?php
include_once 'classes/Language/language.common.php';
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>
            <?php echo $lang['Lang0001']; ?>
        </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <meta name="description" content="Your description">
        <meta name="keywords" content="Your keywords">
        <meta name="author" content="Your name">
        <meta name="format-detection" content="telephone=no" />
        <!--CSS-->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- dialog -->
        <link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="fonts/font-awesome.css">
        <!-- User CSS -->
        <link rel="stylesheet" href="css/user.css">
        <link rel="stylesheet" href="css/focusdata.css">
        <!-- datetime -->
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">






        <link href="css/jquery-ui.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700" rel="stylesheet"
            type="text/css">

        <style>
            .input-contain-unified-search:after,
   
            .pill-us .pico-unified-search,
            .pill-us-mob .pico-unified-search,
            .pill-us .cross-unified-search,
            .pill-us-mob .cross-unified-search,
            .icons-unified-search .icons-image,
            .icons-unified-search.icons-sp .icons-text:after {
                background-repeat: no-repeat;
                background-image: url("img/he-icons-search-64.png");
            }
            
      
            
            input {
                -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
                -webkit-tap-highlight-color: transparent;
            }
            
            .panel-unified-search {
                height: 480px;
                padding: 0;
                background-repeat: no-repeat;
                background-position: center bottom;
                background-color: transparent;
                background-size: cover;
                behavior: url("/js/backgroundsize.min.htc");
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-align: center;
            }
            
            .panel-unified-search h1 {
                height: 170px;
                padding: 65px 0 0;
                margin: 0;
                color: #fff;
                font-size: 35px;
                font-weight: 400;
                display: inline-block;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            .panel-unified-search h1.what-unified-search {
                display: none;
            }
            
            .panel-unified-search h1.what-unified-search.show {
                display: block;
            }
            
            .panel-unified-search h1.book-unified-search {
                padding: 60px 0 0;
            }
            
            .panel-unified-search h1.book-unified-search .smaller-text-us {
                display: block;
                font-size: 20px;
                margin-top: -2px;
                padding-top: 0;
                padding-bottom: 0;
                font-weight: 400;
            }
            
            .panel-unified-search h1.book-unified-search .top-line-us {
                display: inline-block;
            }
            
            .panel-unified-search h1.book-unified-search.show {
                display: block;
            }
            
            .panel-unified-search .box-unified-search {
                height: auto;
                width: 615px;
                margin: 0 auto;
                padding: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-align: center;
            }
            
            .panel-unified-search .box-unified-search h2 {
                color: #fff;
                font-size: 21px;
                font-weight: 400;
                margin: 0;
                padding: 22px 0 0;
                height: 58px;
                display: inline-block;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            
            
            
            
            .panel-unified-search .box-unified-search .type-unified-search {
                height: 78px;
                -webkit-border-radius: 4px !important;
                -moz-border-radius: 4px !important;
                -ms-border-radius: 4px !important;
                border-radius: 4px !important;
                background-clip: padding-box;
                width: 100%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                margin-bottom: 20px;
            }
            
            .panel-unified-search .box-unified-search .input-unified-search {
                max-height: 60px;
                -webkit-border-radius: 4px !important;
                -moz-border-radius: 4px !important;
                -ms-border-radius: 4px !important;
                border-radius: 4px !important;
                background-clip: padding-box;
                width: 100%;
                background-color: transparent;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                position: relative;
                z-index: 10;
            }
            
            .panel-unified-search .box-unified-search .input-unified-search.showing {
                max-height: 500px;
            }
            
            .panel-unified-search .box-unified-search .input-unified-search.showing .location-unified-search {
                -webkit-border-radius: 4px 4px 4px 0 !important;
                -moz-border-radius: 4px 4px 4px 0 !important;
                -ms-border-radius: 4px 4px 4px 0 !important;
                border-radius: 4px 4px 4px 0 !important;
                background-clip: padding-box;
                border-color: #008ec8;
                border-bottom: 1px solid #dddddd;
            }
            
            .input-contain-unified-search {
                position: relative;
            }
            
            .input-contain-unified-search:after {
                position: absolute;
                content: "";
                display: inline-block;
                height: 24px;
                width: 24px;
                margin: 0 0 0 2px;
                vertical-align: middle;
                z-index: 99;
                background-position: -18px -2008px;
                top: 13px;
                left: 7px;
            }
            
            input[type="text"].location-unified-search {
                width: 100%;
                height: 36px;
                border: none;
                margin: 0;
                padding: 0 95px 0 46px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-indent: 0;
                line-height: normal;
                color: #313436;
                font-weight: 400;
                border: 1px solid #dddddd;
                -webkit-border-radius: 4px 10px 10px 4px !important;
                -moz-border-radius: 4px 10px 10px 4px !important;
                -ms-border-radius: 4px 10px 10px 4px !important;
                border-radius: 4px 10px 10px 4px !important;
                background-clip: padding-box;
            }
            
            input[type="text"].location-unified-search::-ms-clear {
                display: none;
            }
            
            input[type="text"].location-unified-search::-webkit-input-placeholder {
                color: #63666a;
                font-style: italic;
                font-weight: 400;
            }
            
            input[type="text"].location-unified-search::-moz-placeholder {
                color: #63666a;
                font-style: italic;
                font-weight: 400;
            }
            
            input[type="text"].location-unified-search:-ms-input-placeholder {
                color: #63666a;
                font-style: italic;
                font-weight: 400;
            }
            
            input[type="text"].location-unified-search:-moz-placeholder {
                color: #63666a;
                font-style: italic;
                font-weight: 400;
            }
            
            .lt-ie9 input[type="text"].location-unified-search {
                line-height: 60px;
            }
            
     
            
            
            
      
            
            .pill-us,
            .pill-us-mob {
                position: absolute;
                max-width: 200px;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
                top: 8px;
                left: 8px;
                height: 32px;
                padding: 5px 32px 0 34px;
                background: #e0edf3;
                color: #008ec8;
                font-weight: 400;
                z-index: 100;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-border-radius: 2px !important;
                -moz-border-radius: 2px !important;
                -ms-border-radius: 2px !important;
                border-radius: 2px !important;
                background-clip: padding-box;
            }
            
            .pill-us .pico-unified-search,
            .pill-us-mob .pico-unified-search {
                position: absolute;
                top: 4px;
                left: 6px;
                display: inline-block;
                height: 24px;
                width: 24px;
            }
            
            .pill-us .cross-unified-search,
            .pill-us-mob .cross-unified-search {
                position: absolute;
                top: 4px;
                right: 4px;
                display: inline-block;
                height: 24px;
                width: 24px;
                background-position: -20px -1940px;
                cursor: pointer;
            }
            
            .pill-us .cross-unified-search:hover,
            .pill-us-mob .cross-unified-search:hover {
                background-position: -84px -1940px;
            }
            
            .pill-us-mob {
                position: relative;
            }
            
            .icons-unified-search {
                height: 78px;
                float: left;
                width: 16.5%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                cursor: pointer;
                background-color: #fff;
                -webkit-transition: background-color 0.5s, border-color 0.5s;
                -moz-transition: background-color 0.5s, border-color 0.5s;
                transition: background-color 0.5s, border-color 0.5s;
                border-right: 1px solid #ecedee;
                border-top: 1px solid #ecedee;
                border-bottom: 1px solid #ecedee;
            }
            
            .tactive .icons-unified-search .icons-image {
                opacity: .5;
            }
            
            .tactive .icons-unified-search .icons-text {
                opacity: .5;
            }
            
             .icons-unified-search:hover {
                background-color: #f7f8fc;
            }
            
            .tactive  .icons-unified-search:hover label.icons-text {
                color: #008ec8;
            }
            
            .tactive  .icons-unified-search:hover.active label.icons-text {
                color: #fff;
            }
            
             .icons-unified-search:hover.icons-sp.active label.icons-text {
                color: #008ec8;
            }
            
             .icons-unified-search.active:hover {
                background-color: #2386c8;
            }
            
             .icons-unified-search.icons-more.active:hover {
                background-color: #fff;
            }
            
            .icons-unified-search.active {
                background-color: #008ec8;
                border-top-color: #008ec8;
                border-bottom-color: #008ec8;
                border-right-color: #008ec8;
            }
            
            .icons-unified-search.active:first-child {
                border-color: #008ec8;
            }
            
            .tactive .icons-unified-search.active .icons-image {
                opacity: 1;
            }
            
            .tactive .icons-unified-search.active .icons-text {
                opacity: 1;
            }
            
            .icons-unified-search.active label.icons-text {
                color: #fff;
            }
            
            .icons-unified-search.active.icons-sp {
                background-color: #fff;
            }
            
            .icons-unified-search.active.icons-sp label.icons-text {
                color: #008ec8;
            }
            
            .icons-unified-search.active.icons-sp #radio-chiro-icon {
                background-position: -80px -204px;
            }
            
            .icons-unified-search.active.icons-sp #radio-psycho-icon {
                background-position: -80px -270px;
            }
            
            .icons-unified-search.active.icons-sp #radio-audio-icon {
                background-position: -80px -524px;
            }
            
            .icons-unified-search.active.icons-sp #radio-podia-icon {
                background-position: -80px -588px;
            }
            
            .icons-unified-search.active.icons-sp #radio-counse-icon {
                background-position: -80px -652px;
            }
            
            .icons-unified-search.active.icons-sp #radio-skin-icon {
                background-position: -80px -716px;
            }
            
            .icons-unified-search.active.icons-sp #radio-opto-icon {
                background-position: -80px -780px;
            }
            
            .icons-unified-search.active.icons-more {
                -webkit-border-radius: 0 4px 0 0 !important;
                -moz-border-radius: 0 4px 0 0 !important;
                -ms-border-radius: 0 4px 0 0 !important;
                border-radius: 0 4px 0 0 !important;
                background-clip: padding-box;
            }
            
            .icons-unified-search.active .icons-sp-search {
                z-index: 15;
                opacity: 1;
            }
            
            .lt-ie9 .icons-unified-search.active .icons-sp-search {
                display: inline-block;
            }
            
            .icons-unified-search.pactive {
                background-color: #008ec8;
            }
            
            .icons-unified-search.pactive label.icons-text {
                color: #fff;
            }
            
            .tactive .icons-unified-search.pactive {
                background-color: #008ec8;
            }
            
            .tactive .icons-unified-search.pactive label.icons-text {
                color: #fff;
            }
            
            .icons-unified-search:first-child {
                -webkit-border-radius: 4px 0 0 4px !important;
                -moz-border-radius: 4px 0 0 4px !important;
                -ms-border-radius: 4px 0 0 4px !important;
                border-radius: 4px 0 0 4px !important;
                background-clip: padding-box;
                border: 1px solid #ecedee;
            }
            
            .icons-unified-search .icons-image {
                display: block;
                margin: 12px auto 2px;
                width: 34px;
                height: 35px;
                float: none;
                clear: both;
            }
            
            .icons-unified-search label.icons-text {
                display: block;
                margin: auto 0;
                float: none;
                clear: both;
                height: 27px;
                padding: 2px 0 0;
                font-size: 11px;
                color: #616365;
                font-weight: 400;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            .icons-unified-search.icons-gp .icons-image {
                background-position: -80px -14px;
            }
            
             .icons-unified-search.icons-gp:hover .icons-image {
                background-position: -16px -14px;
            }
            
            .tactive .icons-unified-search.icons-gp .icons-image {
                background-position: -16px -14px;
            }
            
            .tactive .icons-unified-search.icons-gp:hover .icons-image {
                background-position: -80px -14px;
            }
            
            .tactive .icons-unified-search.icons-gp.active .icons-image {
                background-position: -144px -14px;
            }
            
            .icons-unified-search.icons-dt .icons-image {
                background-position: -80px -78px;
            }
            
             .icons-unified-search.icons-dt:hover .icons-image {
                background-position: -16px -78px;
            }
            
            .tactive .icons-unified-search.icons-dt .icons-image {
                background-position: -16px -78px;
            }
            
            .tactive .icons-unified-search.icons-dt:hover .icons-image {
                background-position: -80px -78px;
            }
            
            .tactive .icons-unified-search.icons-dt.active .icons-image {
                background-position: -144px -78px;
            }
            
            .icons-unified-search.icons-ph .icons-image {
                background-position: -80px -142px;
            }
            
             .icons-unified-search.icons-ph:hover .icons-image {
                background-position: -16px -142px;
            }
            
            .tactive .icons-unified-search.icons-ph .icons-image {
                background-position: -16px -142px;
            }
            
            .tactive .icons-unified-search.icons-ph:hover .icons-image {
                background-position: -80px -142px;
            }
            
            .tactive .icons-unified-search.icons-ph.active .icons-image {
                background-position: -144px -142px;
            }
            
            .icons-unified-search.icons-ch .icons-image {
                background-position: -80px -206px;
            }
            
             .icons-unified-search.icons-ch:hover .icons-image {
                background-position: -16px -206px;
            }
            
            .tactive .icons-unified-search.icons-ch .icons-image {
                background-position: -16px -206px;
            }
            
            .tactive .icons-unified-search.icons-ch:hover .icons-image {
                background-position: -80px -206px;
            }
            
            .tactive .icons-unified-search.icons-ch.active .icons-image {
                background-position: -144px -206px;
            }
            
            .icons-unified-search.icons-ps .icons-image {
                background-position: -80px -270px;
            }
            
             .icons-unified-search.icons-ps:hover .icons-image {
                background-position: -16px -270px;
            }
            
            .tactive .icons-unified-search.icons-ps .icons-image {
                background-position: -16px -270px;
            }
            
            .tactive .icons-unified-search.icons-ps:hover .icons-image {
                background-position: -80px -270px;
            }
            
            .tactive .icons-unified-search.icons-ps.active .icons-image {
                background-position: -144px -270px;
            }
            
            .icons-unified-search.icons-audio .icons-image {
                background-position: -80px -524px;
            }
            
             .icons-unified-search.icons-audio:hover .icons-image {
                background-position: -16px -524px;
            }
            
            .tactive .icons-unified-search.icons-audio .icons-image {
                background-position: -16px -524px;
            }
            
            .tactive .icons-unified-search.icons-audio:hover .icons-image {
                background-position: -80px -524px;
            }
            
            .tactive .icons-unified-search.icons-audio.active .icons-image {
                background-position: -144px -524px;
            }
            
            .icons-unified-search.icons-podia .icons-image {
                background-position: -80px -588px;
            }
            
             .icons-unified-search.icons-podia:hover .icons-image {
                background-position: -16px -588px;
            }
            
            .tactive .icons-unified-search.icons-podia .icons-image {
                background-position: -16px -588px;
            }
            
            .tactive .icons-unified-search.icons-podia:hover .icons-image {
                background-position: -80px -588px;
            }
            
            .tactive .icons-unified-search.icons-podia.active .icons-image {
                background-position: -144px -588px;
            }
            
            .icons-unified-search.icons-counse .icons-image {
                background-position: -80px -652px;
            }
            
             .icons-unified-search.icons-counse:hover .icons-image {
                background-position: -16px -652px;
            }
            
            .tactive .icons-unified-search.icons-counse .icons-image {
                background-position: -16px -652px;
            }
            
            .tactive .icons-unified-search.icons-counse:hover .icons-image {
                background-position: -80px -652px;
            }
            
            .tactive .icons-unified-search.icons-counse.active .icons-image {
                background-position: -144px -652px;
            }
            
            .icons-unified-search.icons-skin .icons-image {
                background-position: -80px -716px;
            }
            
             .icons-unified-search.icons-skin:hover .icons-image {
                background-position: -16px -716px;
            }
            
            .tactive .icons-unified-search.icons-skin .icons-image {
                background-position: -16px -716px;
            }
            
            .tactive .icons-unified-search.icons-skin:hover .icons-image {
                background-position: -80px -716px;
            }
            
            .tactive .icons-unified-search.icons-skin.active .icons-image {
                background-position: -144px -716px;
            }
            
            .icons-unified-search.icons-opto .icons-image {
                background-position: -80px -780px;
            }
            
             .icons-unified-search.icons-opto:hover .icons-image {
                background-position: -16px -780px;
            }
            
            .tactive .icons-unified-search.icons-opto .icons-image {
                background-position: -16px -780px;
            }
            
            .tactive .icons-unified-search.icons-opto:hover .icons-image {
                background-position: -80px -780px;
            }
            
            .tactive .icons-unified-search.icons-opto.active .icons-image {
                background-position: -144px -780px;
            }
            
            .icons-unified-search.icons-sp.icons-more {
                -webkit-border-radius: 0 4px 4px 0 !important;
                -moz-border-radius: 0 4px 4px 0 !important;
                -ms-border-radius: 0 4px 4px 0 !important;
                border-radius: 0 4px 4px 0 !important;
                background-clip: padding-box;
                float: right;
                width: 17.5%;
            }
            
            .icons-unified-search.icons-sp.icons-more.active {
                -webkit-border-radius: 0 4px 0 0 !important;
                -moz-border-radius: 0 4px 0 0 !important;
                -ms-border-radius: 0 4px 0 0 !important;
                border-radius: 0 4px 0 0 !important;
                background-clip: padding-box;
            }
            
            .icons-unified-search.icons-sp {
                position: relative;
                border-right: 1px solid #ecedee;
            }
            
            .icons-unified-search.icons-sp .icons-image {
                background-position: -80px -398px;
            }
            
            .icons-unified-search.icons-sp #radio-radio-icon {
                background-position: -80px -974px;
            }
            
            .tactive .icons-unified-search.icons-sp #radio-radio-icon {
                background-position: -16px -976px;
            }
            
            .tactive .icons-unified-search.icons-sp.active #radio-radio-icon {
                background-position: -80px -976px;
            }
            
            .icons-unified-search.icons-sp:hover .icons-image {
                background-position: -80px -398px;
            }
            
            .icons-unified-search.icons-sp.active {
                border-color: #ecedee;
            }
            
            .icons-unified-search.icons-sp.active .icons-image {
                background-position: -80px -398px;
            }
            
            .tactive .icons-unified-search.icons-sp .icons-image {
                background-position: -16px -398px;
            }
            
             .tactive .icons-unified-search.icons-sp.icons-sp.icons-radio:hover .icons-image {
                background-position: -16px -398px;
            }
            
            .tactive .icons-unified-search.icons-sp.active {
                border-color: #ecedee;
            }
            
            .tactive .icons-unified-search.icons-sp.active .icons-image {
                background-position: -80px -398px;
            }
            
             .tactive .icons-unified-search.icons-sp.active:hover .icons-image {
                background-position: -80px -398px;
            }
            
            .tactive .icons-unified-search.icons-sp.active .icons-text:after {
                background-position: -89px -1305px;
            }
            
            .icons-unified-search.icons-sp.pactive .icons-text:after {
                background-position: -155px -1305px;
            }
            
            .icons-unified-search.icons-sp.pactive.active .icons-text:after {
                background-position: -89px -1305px;
            }
            
            .icons-unified-search.icons-sp #radio-gp-icon {
                background-position: -144px -14px;
            }
            
            .icons-unified-search.icons-sp #radio-dentist-icon {
                background-position: -144px -78px;
            }
            
            .icons-unified-search.icons-sp #radio-ph-icon {
                background-position: -144px -142px;
            }
            
            .icons-unified-search.icons-sp #radio-ch-icon {
                background-position: -144px -206px;
            }
            
            .icons-unified-search.icons-sp #radio-physio-icon {
                background-position: -144px -270px;
            }
            
            .icons-unified-search.icons-sp #radio-chiro-icon {
                background-position: -144px -204px;
            }
            
            .icons-unified-search.icons-sp #radio-psycho-icon {
                background-position: -144px -270px;
            }
            
            .icons-unified-search.icons-sp #radio-audio-icon {
                background-position: -144px -524px;
            }
            
            .icons-unified-search.icons-sp #radio-podia-icon {
                background-position: -144px -588px;
            }
            
            .icons-unified-search.icons-sp #radio-counse-icon {
                background-position: -144px -652px;
            }
            
            .icons-unified-search.icons-sp #radio-skin-icon {
                background-position: -144px -716px;
            }
            
            .icons-unified-search.icons-sp #radio-opto-icon {
                background-position: -144px -780px;
            }
            
            .icons-unified-search.icons-sp #radio-xray-icon {
                background-position: -144px -976px;
            }
            
            .icons-unified-search.icons-sp #radio-ctscan-icon {
                background-position: -144px -1166px;
            }
            
            .icons-unified-search.icons-sp #radio-mri-icon {
                background-position: -144px -1230px;
            }
            
            .icons-unified-search.icons-sp #radio-ultra-icon {
                background-position: -144px -1102px;
            }
            
            .icons-unified-search.icons-sp .icons-text:after {
                content: "";
                display: inline-block;
                height: 16px;
                width: 12px;
                margin: 0 0 0 3px;
                vertical-align: middle;
                background-position: -25px -1305px;
            }
            
            .icons-unified-search.icons-sp:hover .icons-text:after,
            .icons-unified-search.icons-sp:active .icons-text:after,
            .icons-unified-search.icons-sp:focus .icons-text:after {
                background-position: -89px -1305px;
            }
            
            .icons-unified-search.icons-sp.pactive {
                border-color: #008ec8;
            }
            
            .icons-unified-search.icons-sp.pactive .icons-image {
                opacity: 1;
            }
            
            .icons-unified-search.icons-sp.pactive .icons-text {
                opacity: 1;
            }
            
            .icons-unified-search.icons-sp.pactive:hover .icons-text:after {
                background-position: -155px -1305px;
            }
            
            .icons-unified-search.icons-sp.pactive.active:hover .icons-text:after {
                background-position: -89px -1305px;
            }
            
            .icons-unified-search .icons-sp-search {
                width: 100%;
                position: absolute;
                margin-top: 0;
                z-index: -1;
                opacity: 0;
                -moz-transition: opacity .3s;
                -webkit-transition: opacity .3s;
                transition: opacity .3s;
                background-color: #fff;
                -webkit-border-radius: 0 0 4px 4px !important;
                -moz-border-radius: 0 0 4px 4px !important;
                -ms-border-radius: 0 0 4px 4px !important;
                border-radius: 0 0 4px 4px !important;
                background-clip: padding-box;
                -webkit-box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2);
                -moz-box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2);
                box-shadow: 0 4px 4px 0 rgba(0, 0, 0, 0.2);
                overflow: hidden;
                padding-bottom: 10px;
                margin-left: 1px;
            }
            
            .lt-ie9 .icons-unified-search .icons-sp-search {
                display: none;
            }
            
            .icons-unified-search .icons-sp-search span.ius-mob {
                display: none;
            }
            
            .icons-unified-search .icons-sp-search span {
                display: block;
                color: #63666a;
                font-size: 12px;
                cursor: pointer;
                -webkit-transition: background-color .3s;
                -moz-transition: background-color .3s;
                transition: background-color .3s;
            }
            
            .icons-unified-search .icons-sp-search span:hover label {
                color: #008ec8;
                background-color: #f7f8fc;
            }
            
            .icons-unified-search .icons-sp-search span.active {
                color: #fff;
            }
            
            .icons-unified-search .icons-sp-search span.active label {
                color: #fff;
                background-color: #008ec8;
            }
            
            .icons-unified-search .icons-sp-search span.active:hover label {
                color: #fff;
                background-color: #008ec8;
            }
            
            .icons-unified-search .icons-sp-search span label {
                display: block;
                padding: 6px 10px 6px 16px;
                font-size: 11px;
                color: #777777;
                font-weight: 400;
                margin: 0;
                text-align: left;
            }
            
            #unified-search-form-inline {
                margin: 0;
            }
            
            .btn {
                position: absolute;
                top: 0;
                right: 0;
                width: 90px;
                height: 36px;
                text-align: center;
                color: #fff;
                text-transform: capitalize;
                font-size: 15px;
                font-weight: 400;
                -webkit-border-radius: 0 4px 4px 0 !important;
                -moz-border-radius: 0 4px 4px 0 !important;
                -ms-border-radius: 0 4px 4px 0 !important;
                border-radius: 0 4px 4px 0 !important;
                background-clip: padding-box;
                display: inline-block;
                *display: inline;
                *zoom: 1;
                padding: 9px 12px;
                margin-bottom: 0;
                font-size: 15px;
                font-weight: 500;
                line-height: 10px;
                text-align: center;
                text-decoration: none;
                vertical-align: middle;
                cursor: pointer;
                border: none;
                color: #fff;
                background-color: #008ec7;
                *background-color: #2386c8;
                *border: 0;
                *margin-left: .3em
            }
            
            .btn a {
                color: #fff;
                text-decoration: none
            }
            
            .btn a:hover,
            .btn a:focus,
            .btn a:active {
                text-decoration: underline
            }
            
            .btn:hover,
            .btn:focus,
            .btn:active {
                color: #fff;
                background-color: #2386c8;
                *background-color: #1f77b2
            }
            
            .btn:active {
                background-color: #1b699d \9
            }
            
            .btn:first-child {
                *margin-left: 0
            }
            
            .btn:hover,
            .btn:focus {
                color: #fff;
                background-color: #2386c8;
                text-decoration: none
            }
            
            .btn:focus {
                outline: thin dotted #333;
                outline: 5px auto -webkit-focus-ring-color;
                outline-offset: -2px
            }
            
            .btn:active {
                background-image: none;
                outline: 0
            }
        </style>
        <!--JS-->
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/sForm.js"></script>

    </head>

    <body>
        <!--header-->
        <div class="container bars"><em class="bars_"></em></div>
        <header>
            <?php
    include_once 'classes/Menu/menu.php';
    ?>
                <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
        </header>
        <!--content-->
        <div class="content index">
            <div class="thumb-box1">
                <div class="container">
                    <div class="panel-unified-search">

                        <div class="box-unified-search">
                            <div class="type-unified-search">
                                <div class="icons-unified-search icons-act icons-gp">
                                    <input name="search-option-type" class="hide" type="radio" id="radio-gp" value="gp">
                                    <span class="icons-image"></span>
                                    <label class="icons-text" for="radio-gp">GP</label>
                                </div>
                                <div class="icons-unified-search icons-act icons-dt">
                                    <input name="search-option-type" class="hide" type="radio" id="radio-dentist" value="dentist">
                                    <span class="icons-image"></span>
                                    <label class="icons-text" for="radio-dentist">Dentist</label>
                                </div>
                                <div class="icons-unified-search icons-act icons-ph"><input name="search-option-type" class="hide" type="radio" id="radio-physio" value="physiotherapist">
                                    <span class="icons-image"></span>
                                    <label class="icons-text" for="radio-physio">Physio</label>
                                </div>
                                <div class="icons-unified-search icons-act icons-ch"><input name="search-option-type" class="hide" type="radio" id="radio-chiro" value="chiropractor">
                                    <span class="icons-image"></span>
                                    <label class="icons-text" for="radio-chiro">Chiropractor</label>
                                </div>
                                <div class="icons-unified-search icons-act icons-ps"><input name="search-option-type" class="hide" type="radio" id="radio-psycho" value="psychologist">
                                    <span class="icons-image"></span>
                                    <label class="icons-text" for="radio-psycho">Psychologist</label>
                                </div>
                                <div class="icons-unified-search icons-act icons-sp icons-more">
                                    <span class="icons-image icons-sp-icon" id=""></span><label class="icons-text icons-sp-text">More</label>
                                    <div class="icons-sp-search"><span class="ius-act ius-mob">
                                        <input name="search-option-type" class="hide" type="radio" value="chiropractor" id="radio-chiro">
                                        <label class="radio-chiro" for="radio-chiro">Chiropractor</label></span>
                                        <span class="ius-act ius-mob">
                                            <input name="search-option-type" class="hide" type="radio" value="psychologist" id="radio-psycho"><label class="radio-psycho"
                    for="radio-psycho">Psychologist</label></span><span class="ius-act"><input name="search-option-type" class="hide" type="radio" value="audiologist" id="radio-audio"><label class="radio-audio" for="radio-audio">Audiologist</label></span>
                                        <span class="ius-act"><input name="search-option-type" class="hide" type="radio" value="podiatrist" id="radio-podia"><label class="radio-podia"
                        for="radio-podia">Podiatrist</label></span><span class="ius-act"><input name="search-option-type" class="hide" type="radio" value="counsellor" id="radio-counse"><label class="radio-counse" for="radio-counse">Counsellor</label></span>
                                        <span class="ius-act"><input name="search-option-type" class="hide" type="radio" value="skinchecks" id="radio-skin">
                        <label
                            class="radio-skin" for="radio-skin">Skin Checks</label>
                            </span><span class="ius-act"><input name="search-option-type" class="hide" type="radio" value="optometry" id="radio-opto"><label class="radio-opto" for="radio-opto">Optometry</label></span></div>
                                </div>
                            </div>
            
                            <div class="input-unified-search">
                                <div class="input-contain-unified-search">

                                    <form id="unified-search-form-inline">
                                        <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                        <input type="hidden" class="form-control" name="from_index" id="from_index" value="1">


                                       
                                        <input id="location-unified-search" class="location-unified-search" placeholder="Suburb, State, Postcode" type="text" name="CLINIC_SUBURB">


                                        <button tabindex="-1" id="btn_search" class="btn">Search</button>
                                    </form>
                                </div>

                            </div>



                        </div>
                    </div>

                    <div class="col-lg-12">
                        <p class="title wow fadeInUp">We specialize in helping patients with symptomatic rapid appointment to doctor.</p>
                    </div>
                    <div class="col-lg-10 col-lg-offset-1">
                        <p class="description wow fadeInUp" data-wow-delay="0.1s">Nos especializamos en ayudar a los pacientes con cita rápida sintomática en médico.</p>
                        <a href="index-2.php" class="btn-default btn1 wow fadeInUp" data-wow-delay="0.2s">read more</a>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <?php
include_once 'classes/Footer/Footer.php';
?>
            <?php
include_once 'classes/Language/For_JS_multi_lang.php';
?>
                <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
                <script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
                <script src="js/bootstrap.min.js"></script>
                <!-- dialog -->
                <script src="js/bootstrap-dialog.min.js"></script>

                <script src="js/tm-scripts.js"></script>
                <script src="js/jquery.cookie.js"></script>
                <script src="js/jquery-ui.js"></script>

                
                <script src="js/main/pub.js"></script>
                <script src="js/main/index.js"></script>
                <script type="text/javascript" src="js/main/index_search.js"></script>



    </body>

    </html>