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

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="fonts/font-awesome.css">

        
        <!-- User CSS -->
        <link rel="stylesheet" href="css/user.css">
        <link rel="stylesheet" href="css/focusdata.css">

        <link rel="stylesheet" href="css/bootstrap-multiselect-index.css">
        
        <link href="css/jquery-ui.css" rel="stylesheet">

        <style>
            * {
                box-sizing: border-box;
            }

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
                        
            .input-contain-unified-search {
                position: relative;
            }
            
            .input-contain-unified-search:after {
                position: absolute;
                content: "";
                display: inline-block;
                height: 24px;
                width: 24px;
                margin: 4 0 0 2px;
                vertical-align: middle;
                z-index: 99;
                background-position: -18px -2008px;
                top: 13px;
                left: 7px;
            }
            
            select.location-unified-search {
                width: 20%;
                height: 46px;
                border: none;
                margin: 0;
                padding: 0 15px 0 6px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-indent: 0;
                line-height: normal;
                color: #313436;
                font-weight: 400;
                border: 2px solid #2B268F;
               /* -webkit-border-radius: 4px 10px 10px 4px !important;
                -moz-border-radius: 4px 10px 10px 4px !important;
                -ms-border-radius: 4px 10px 10px 4px !important;*/
               /* border-radius: 4px 10px 10px 4px !important;*/
                background-clip: padding-box;
				position: relative;
				left:-50px;
            }
			
			input[type="text"].location-unified-search {
                width: 40%;
                height: 46px;
                border: none;
                margin: 0;
                padding: 0 55px 0 40px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-indent: 0;
                line-height: normal;
                color: #313436;
                font-weight: 400;
                border: 2px solid #2b268f;
                -webkit-border-radius: 4px 10px 10px 4px !important;
                -moz-border-radius: 4px 10px 10px 4px !important;
                -ms-border-radius: 4px 10px 10px 4px !important;
                border-radius: 4px 10px 10px 4px !important;
                background-clip: padding-box;
				position:relative;
				left:-50px;
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
            
            
            
            .btnSearch {
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
                padding: 12px 12px;
                margin-bottom: 0;
                font-size: 15px;
                font-weight: 500;
               
                text-align: center;
                text-decoration: none;
                vertical-align: middle;
                cursor: pointer;
                border: none;
                color: #fff;
                background-color: #4f798c;
            }
            
            .btnSearch a {
                color: #fff;
                text-decoration: none
            }
            
            .btnSearch a:hover,
            .btnSearch a:focus,
            .btnSearch a:active {
                text-decoration: underline
            }
            
            .btnSearch:hover,
            .btnSearch:focus,
            .btnSearch:active {
                color: #fff;
                background-color: #2386c8;
                *background-color: #1f77b2
            }
            
            .btnSearch:active {
                background-color: #1b699d \9
            }
            
            .btnSearch:first-child {
                *margin-left: 0
            }
            
            .btnSearch:hover,
            .btnSearch:focus {
                color: #fff;
                background-color: #2386c8;
                text-decoration: none
            }
            
            .btnSearch:focus {
                outline: thin dotted #333;
                outline: 5px auto -webkit-focus-ring-color;
                outline-offset: -2px
            }
            
            .btnSearch:active {
                background-image: none;
                outline: 0
            }
            
            .index-main-box {
                padding: 155px 0 45px 0;
                background: #005182 url(img/bg_pic_new.jpg) center 0 no-repeat;
                background-size: cover;
                text-align: center;
                height: 650px;
                overflow: hidden;
            }
			
			 .index-second-box {
                padding: 60px 50px 25px 50px;
                text-align: left;
                height: 750px;
                overflow: hidden;
				color:#ffffff !important;
				background-color: #07889B
				
            }

            @media (max-width: 900px) {
                .index-second-box {
                display:none;
				
            }

            }
			
			.index-second-content {
				height:300px;
				padding-top: 40px;
			}
			
			.index-second-heading {
				padding-top: 20px;
				
			}
			
			.index-second-list{
				font-size: 18;
			}
			
			.footer-box {
				height:240px;
			}
			.footer-info{
				height:120px;
			}
			
			.footer-text-title{
				color:#ffffff;
			}
			
			footer  a {
				color : #ffffff;
				display: block;
				margin-top:4px;
			}
			
			.footer-follow{
				display: inline;
			}
			
			.index-second-image{
				height: 184px;
				width: 278px;
			}

            @media (max-width: 1024px) {
                .index-second-image{
				height: 132px;
				width: 200px;
			}

            }



			div.index-second-box h2 {
                color:#ffffff;
				font-size:38;
				
            }
            
            .box-unified-search {
                height: auto;
                width: 655px;
                margin: 0 auto;
                padding: 0;
            }
            
            @media (max-width: 767px) {
                .box-unified-search {
                    background: #eff3f3;
                    border: none;
                    height: auto;
                    width: 100%;
                    padding: 25px 5% 15px;
                    border-radius: 0 !important;
                    background-clip: padding-box;
                }
            }
            
            .type-unified-search {
                height: 78px;
                background-clip: padding-box;
                width: 100%;
                margin-bottom: 50px;
            }
            
            .icons-unified-search {
                height: 78px;
                float: left;
                width: 16.5%;
                cursor: pointer;
                background-color: #fff;
                transition: background-color 0.5s, border-color 0.5s;
                border-right: 1px solid #ecedee;
                border-top: 1px solid #ecedee;
                border-bottom: 1px solid #ecedee;
            }
            
            .icons-unified-search:hover {
                background-color: #f7f8fc;
            }
            
            @media (max-width: 767px) {
                .icons-unified-search {
                    width: 25%;
                }
            }
            
            .icons-unified-search:first-child {
                border-radius: 4px 0 0 4px !important;
                background-clip: padding-box;
                border: 1px solid #ecedee;
            }
            
            .icons-more {
                border-radius: 0 4px 4px 0 !important;
                background-clip: padding-box;
                float: right;
                width: 17.5%;
            }
            
            .gp-pill {
                background-position: -276px -20px;
            }
            
            .dt-pill {
                background-position: -276px -84px;
            }
            
            .ph-pill {
                background-position: -276px -148px;
            }
            
            .xray-pill {
                background-position: -276px -980px;
            }
            
            .ctscan-pill {
                background-position: -276px -1172px;
            }
            
            .mri-pill {
                background-position: -276px -1236px;
            }
            
            .ultra-pill {
                background-position: -276px -1108px;
            }
            
            .ch-pill {
                background-position: -276px -212px;
            }
            
            .ps-pill {
                background-position: -276px -276px;
            }
            
            .audio-pill {
                background-position: -276px -532px;
            }
            
            .podia-pill {
                background-position: -276px -596px;
            }
            
            .counse-pill {
                background-position: -276px -660px;
            }
            
            .skin-pill {
                background-position: -276px -724px;
            }
            
            .opto-pill {
                background-position: -276px -788px;
            }
            
            .local-pill {
                background-position: -84px -1620px;
            }
            
            .specialty-pill {
                background-position: -84px -1750px;
            }
            
            .practice-pill {
                background-position: -84px -1430px;
            }
            
            .practitioner-pill {
                background-position: -84px -1494px;
            }
            
            .intproc-pill {
                background-position: -84px -1556px;
            }
            
            .search-pill {
                background-position: -84px -1686px;
            }
            
            .search-head-trigger {
                position: absolute;
                display: inline-block;
                width: 26px;
                height: 28px;
                text-indent: -9999px;
                margin: 0;
                left: 7px;
                top: 12px;
                background-position: -21px -2066px;
                cursor: pointer;
                vertical-align: middle;
                z-index: 9;
            }
            
            .search-head-trigger:hover,
            .search-head-trigger:active {
                background-position: -85px -2066px;
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
            
            @media (max-width: 767px) {
                .pill-us,
                .pill-us-mob {
                    padding-left: 8px;
                    padding-right: 26px;
                }
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
            
            @media (max-width: 767px) {
                .pill-us .pico-unified-search,
                .pill-us-mob .pico-unified-search {
                    display: none;
                }
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
            
            @media (max-width: 767px) {
                .pill-us .cross-unified-search,
                .pill-us-mob .cross-unified-search {
                    right: 2px;
                }
            }
            
            @media (max-width: 767px) {
                .pill-us {
                    top: 6px;
                    left: 6px;
                }
            }
            
            .pill-us-mob {
                position: relative;
            }
            
            @media (max-width: 767px) {
                .pill-us-mob {
                    display: inline-block;
                    margin-left: 0;
                    margin-top: 2px;
                    left: 38px;
                }
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
            
            @media (max-width: 767px) {
                .icons-unified-search {
                    width: 25%;
                }
            }
            
            .tactive .icons-unified-search .icons-image {
                opacity: .5;
            }
            
            .tactive .icons-unified-search .icons-text {
                opacity: .5;
            }
            
            .no-touchevents .icons-unified-search:hover {
                background-color: #f7f8fc;
            }
            
            .tactive .no-touchevents .icons-unified-search:hover label.icons-text {
                color: #008ec8;
            }
            
            .tactive .no-touchevents .icons-unified-search:hover.active label.icons-text {
                color: #fff;
            }
            
            .no-touchevents .icons-unified-search:hover.icons-sp.active label.icons-text {
                color: #008ec8;
            }
            
            .no-touchevents .icons-unified-search.active:hover {
                background-color: #2386c8;
            }
            
            .no-touchevents .icons-unified-search.icons-more.active:hover {
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
                width: 36px;
                height: 36px;
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
                font-size: 13px;
                color: #616365;
                font-weight: 400;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            @media (max-width: 767px) {
                .icons-unified-search label.icons-text {
                    font-size: 12px;
                }
            }
            
            .icons-unified-search.icons-gp .icons-image {
                background-position: -80px -14px;
            }
            
            .no-touchevents .icons-unified-search.icons-gp:hover .icons-image {
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
            
            .no-touchevents .icons-unified-search.icons-dt:hover .icons-image {
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

            .icons-unified-search.icons-dietitian .icons-image {
                background-position: -80px -334px;
            }
            
            .no-touchevents .icons-unified-search.icons-dietitian:hover .icons-image {
                background-position: -16px -334px;
            }
            
            .tactive .icons-unified-search.icons-dietitian .icons-image {
                background-position: -16px -334px;
            }
            
            .tactive .icons-unified-search.icons-dietitian:hover .icons-image {
                background-position: -80px -334px;
            }
            
            .tactive .icons-unified-search.icons-dietitian.active .icons-image {
                background-position: -144px -334px;
            }


            
            .icons-unified-search.icons-ph .icons-image {
                background-position: -80px -142px;
            }
            
            .no-touchevents .icons-unified-search.icons-ph:hover .icons-image {
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

            @media (max-width: 767px) {
                .icons-unified-search.icons-ph {
                    display: none;
                }
            }

            
            .icons-unified-search.icons-ch .icons-image {
                background-position: -80px -206px;
            }
            
            .no-touchevents .icons-unified-search.icons-ch:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-ch {
                    display: none;
                }
            }


            .icons-unified-search.icons-Podiatrist .icons-image {
                background-position: -80px -590px;
            }
            
            .no-touchevents .icons-unified-search.icons-Podiatrist:hover .icons-image {
                background-position: -16px -590px;
            }
            
            .tactive .icons-unified-search.icons-Podiatrist .icons-image {
                background-position: -16px -590px;
            }
            
            .tactive .icons-unified-search.icons-Podiatrist:hover .icons-image {
                background-position: -80px -590px;
            }
            
            .tactive .icons-unified-search.icons-Podiatrist.active .icons-image {
                background-position: -144px -590px;
            }
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-Podiatrist {
                    display: none;
                }
            }

           
            
            .icons-unified-search.icons-ps .icons-image {
                background-position: -80px -270px;
            }
            
            .no-touchevents .icons-unified-search.icons-ps:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-ps {
                    display: none;
                }
            }
            
            .icons-unified-search.icons-audio .icons-image {
                background-position: -80px -524px;
            }
            
            .no-touchevents .icons-unified-search.icons-audio:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-audio {
                    display: none;
                }
            }
            
            .icons-unified-search.icons-podia .icons-image {
                background-position: -80px -588px;
            }
            
            .no-touchevents .icons-unified-search.icons-podia:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-podia {
                    display: none;
                }
            }
            
            .icons-unified-search.icons-counse .icons-image {
                background-position: -80px -652px;
            }
            
            .no-touchevents .icons-unified-search.icons-counse:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-counse {
                    display: none;
                }
            }
            
            .icons-unified-search.icons-skin .icons-image {
                background-position: -80px -716px;
            }
            
            .no-touchevents .icons-unified-search.icons-skin:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-skin {
                    display: none;
                }
            }
            
            .icons-unified-search.icons-opto .icons-image {
                background-position: -80px -780px;
            }
            
            .no-touchevents .icons-unified-search.icons-opto:hover .icons-image {
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-opto {
                    display: none;
                }
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-sp.icons-more {
                    width: 25%;
                }
            }
            
            .icons-unified-search.icons-sp.icons-more.active {
                -webkit-border-radius: 0 4px 0 0 !important;
                -moz-border-radius: 0 4px 0 0 !important;
                -ms-border-radius: 0 4px 0 0 !important;
                border-radius: 0 4px 0 0 !important;
                background-clip: padding-box;
            }
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-sp.icons-radio {
                    display: none;
                }
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
            
            .no-touchevents .tactive .icons-unified-search.icons-sp.icons-sp.icons-radio:hover .icons-image {
                background-position: -16px -398px;
            }
            
            .tactive .icons-unified-search.icons-sp.active {
                border-color: #ecedee;
            }
            
            .tactive .icons-unified-search.icons-sp.active .icons-image {
                background-position: -80px -398px;
            }
            
            .no-touchevents .tactive .icons-unified-search.icons-sp.active:hover .icons-image {
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
                background-position: -144px -142px;
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
            
            @media (max-width: 767px) {
                .icons-unified-search.icons-sp .icons-text:after {
                    content: none;
                    display: none;
                }
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
            
            @media (max-width: 767px) {
                .icons-unified-search .icons-sp-search {
                    width: 120px;
                    right: 0;
                }
                .icons-unified-search .icons-sp-search span.ius-mob {
                    display: block;
                }
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
                font-size: 13px;
                color: #777777;
                font-weight: 400;
                margin: 0;
                text-align: left;
            }
            
            @media (max-width: 767px) {
                .icons-unified-search .icons-sp-search span label {
                    text-align: center;
                    padding: 6px 10px;
                }
            }
            
            #unified-search-form-inline {
                margin: 0;
            }
            
            .find-prac-search {
                height: 290px;
                font-family: 'Source Sans Pro', 'Open Sans', sans-serif;
            }
            
            @media (max-width: 767px) {
                .find-prac-search {
                    padding: 0;
                    width: 100%;
                    height: auto;
                    -webkit-box-sizing: border-box;
                    -moz-box-sizing: border-box;
                    box-sizing: border-box;
                }
            }
            
            .find-prac-search.panel-unified-search {
                background: transparent url("/images/search/find-prac-main-image.jpg") repeat center top;
                background-size: cover;
                width: 100%;
                background-position: center -350px;
            }
            
            @media (min-width: 980px) and (max-width: 1199px) {
                .find-prac-search.panel-unified-search {
                    background-position: center -300px;
                }
            }
            
            @media (min-width: 768px) and (max-width: 979px) {
                .find-prac-search.panel-unified-search {
                    background-position: center right;
                    background-size: auto 135%;
                }
            }
            
            .find-prac-search.panel-unified-search .alpha-unified-search {
                width: 100%;
                height: 100%;
                background: transparent url("/images/home/unified-search-alpha25.png") repeat center top;
            }
            
            .find-prac-search.panel-unified-search h1.book-unified-search {
                margin: 0 auto;
                padding-top: 70px;
                width: 100%;
            }
            
            @media (max-width: 767px) {
                .find-prac-search.panel-unified-search h1.book-unified-search {
                    padding: 20px 5% 15px;
                    height: auto;
                    width: 100%;
                }
            }
            
            @media (max-width: 767px) {
                .find-prac-search.panel-unified-search h1.book-unified-search .smaller-text-us {
                    font-size: 15px;
                    padding-top: 6px;
                    padding-bottom: 0;
                }
            }
            
            .find-prac-search.panel-unified-search .box-unified-search {
                height: 80px;
                padding-top: 15px;
            }
            
            @media (max-width: 767px) {
                .find-prac-search.panel-unified-search .box-unified-search {
                    height: auto;
                    width: 100%;
                    padding-top: 25px;
                    padding-bottom: 32px;
                }
            }
            
            .find-prac-search.panel-unified-search .input-unified-search {
                margin-bottom: 5px;
            }
            
            .find-practitioner-popular,
            .obs-feature {
                width: 100%;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-border-radius: 0 !important;
                -moz-border-radius: 0 !important;
                -ms-border-radius: 0 !important;
                border-radius: 0 !important;
                background-clip: padding-box;
            }
            
            .find-practitioner-popular {
                background: #fff;
                margin: 0 auto;
                padding: 70px 0;
            }
            
            .find-practitioner-popular h2 {
                font-size: 26px;
                color: #2b4b5a;
                font-weight: 400;
                margin: 0 0 35px;
            }
            
            .find-practitioner-popular ul {
                text-align: left;
                width: 615px;
                margin: 0;
            }
            
            .find-practitioner-popular ul li {
                line-height: normal;
                width: 25%;
                margin: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }
            
            .find-practitioner-popular ul li a {
                font-size: 13px;
                padding: 0;
                background: #fff;
                text-decoration: none;
                color: #008ec8;
                font-weight: 400;
                border: none;
                -webkit-border-radius: 0 !important;
                -moz-border-radius: 0 !important;
                -ms-border-radius: 0 !important;
                border-radius: 0 !important;
                background-clip: padding-box;
            }
            
            .find-practitioner-popular ul li a:hover,
            .find-practitioner-popular ul li a:active {
                color: #2b4b5a;
                background: #fff;
            }
            
            .obs-feature {
                border-bottom: none;
                background: #008ec8;
                padding: 70px 5%;
                text-align: center;
                font-weight: 400;
            }
            
            .obs-feature h3 {
                color: #fff;
                font-size: 26px;
                font-weight: 400;
                margin: 0 0 15px;
            }
            
            .obs-feature p {
                padding: 0 0 2px;
                margin: 0;
                font-size: 18px;
                line-height: normal;
            }
            
            .obs-feature a {
                display: inline-block;
                width: 180px;
                height: 42px;
                line-height: 42px;
                padding: 0;
                margin: 40px 0 0;
                border: 1px solid #fff;
                font-size: 15px;
                text-align: center;
                -webkit-border-radius: 4px !important;
                -moz-border-radius: 4px !important;
                -ms-border-radius: 4px !important;
                border-radius: 4px !important;
                background-clip: padding-box;
                text-decoration: none;
            }
            
            .obs-feature a:hover,
            .obs-feature a:active {
                background: #007caf;
            }
            
            @media (max-width: 767px) {
                .obs-feature a {
                    width: 100%;
                }
            }
            
            @media (max-width: 767px) {
                .obs-feature {
                    -webkit-box-sizing: border-box;
                    -moz-box-sizing: border-box;
                    box-sizing: border-box;
                    margin-bottom: 16px;
                    -webkit-border-radius: 0 !important;
                    -moz-border-radius: 0 !important;
                    -ms-border-radius: 0 !important;
                    border-radius: 0 !important;
                    background-clip: padding-box;
                }
            }
        </style>
        <!--JS-->
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.2.1.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        <script src="js/jquery.equalheights.js"></script>

        <style>
            .dropdown-toggle {
                font:inherit;
                height: 46px;
                border: none;
                margin: 0;
                padding: 0 15px 0 6px;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                text-indent: 0;
                line-height: normal;
                color: #313436;
                font-weight: 400;
                border: 2px solid #2B268F;
               /* -webkit-border-radius: 4px 10px 10px 4px !important;
                -moz-border-radius: 4px 10px 10px 4px !important;
                -ms-border-radius: 4px 10px 10px 4px !important;*/
               /* border-radius: 4px 10px 10px 4px !important;*/
                background-clip: padding-box;
				position: relative;
				left:-50px;
                width:145px;
                top:-1px;
            }
            .btn .caret {
    margin-left: 40px;
}
        </style>

    </head>

    <body>
        <!--header-->
        <div class="container bars"></div>
        <?php
    include_once 'classes/Menu/menu.php';
    ?>
            <header>

                <h1 class="navbar-brand navbar-brand_"  ><a href="index.php"><img src="img/<?php echo $lang['Lang0344']; ?>" alt="logo"></a></h1>
            </header>

            <div class="index-main-box">

				<h3 style="text-align: center; position: relative;top:-70px; color: #0F4F40 ; font-size:30px !important; " class="index_slogan"><?php echo $lang['Lang0386']; ?></h3>
                <div class="box-unified-search">

                    <div class="type-unified-search" style="display: none">
                        <div class="icons-unified-search icons-act icons-gp">
                            <input name="search-option-type" class="hide" type="radio" id="radio-gp" value="gp">
                            <span class="icons-image"></span>
                            <label class="icons-text" for="radio-gp"><?php echo $lang['Lang0348']; ?></label>
                        </div>
                        <div class="icons-unified-search icons-act icons-dt">
                            <input name="search-option-type" class="hide" type="radio" id="radio-dentist" value="dentist">
                            <span class="icons-image"></span>
                            <label class="icons-text" for="radio-dentist"><?php echo $lang['Lang0349']; ?></label>
                        </div>
                        <div class="icons-unified-search icons-act icons-dietitian">
                            <input name="search-option-type" class="hide" type="radio" id="radio-dietitian" value="dietitian">
                            <span class="icons-image"></span>
                            <label class="icons-text" for="radio-dietitian"><?php echo $lang['Lang0350']; ?></label>
                        </div>

                        <div class="icons-unified-search icons-act icons-ph"><input name="search-option-type" class="hide" type="radio" id="radio-physio" value="physiotherapist">
                            <span class="icons-image"></span>
                            <label class="icons-text" for="radio-physio"><?php echo $lang['Lang0351']; ?></label>
                        </div>
                        <div class="icons-unified-search icons-act icons-Podiatrist"><input name="search-option-type" class="hide" type="radio" id="radio-podia" value="podiatrist">
                            <span class="icons-image"></span>
                            <label class="icons-text" for="radio-podia"><?php echo $lang['Lang0352']; ?></label>
                        </div>
                        
                        <div class="icons-unified-search icons-act icons-sp icons-more">
                            <span class="icons-image icons-sp-icon" id=""></span>
                            <label class="icons-text icons-sp-text"><?php echo $lang['Lang0353']; ?></label>
                            <div class="icons-sp-search">
                                <span class="ius-act ius-mob">
                                        <input name="search-option-type" class="hide" type="radio" value="physio" id="radio-physio">
                                        <label class="radio-physio" for="radio-physio"><?php echo $lang['Lang0351']; ?></label>
                                </span>
                                <span class="ius-act ius-mob">
                                        <input name="search-option-type" class="hide" type="radio" value="podiatrist" id="radio-podia">
                                        <label class="radio-podia" for="radio-podia"><?php echo $lang['Lang0352']; ?></label>
                                </span>

                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="psychologist" id="radio-psycho">
                                    <label class="radio-psycho" for="radio-psycho"><?php echo $lang['Lang0354']; ?></label>
                                </span>
                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="chiropractor" id="radio-chiro">
                                    <label class="radio-chiro" for="radio-chiro"><?php echo $lang['Lang0355']; ?></label>
                                </span>
                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="audiologist" id="radio-audio">
                                    <label class="radio-audio" for="radio-audio"><?php echo $lang['Lang0356']; ?></label>
                                </span>
                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="optometry" id="radio-opto">
                                    <label class="radio-opto" for="radio-opto"><?php echo $lang['Lang0357']; ?></label>
                                </span>
                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="skinchecks" id="radio-skin">
                                    <label class="radio-skin" for="radio-skin"><?php echo $lang['Lang0358']; ?></label>
                                </span>
                                <span class="ius-act">
                                    <input name="search-option-type" class="hide" type="radio" value="counsellor" id="radio-counse">
                                    <label class="radio-counse" for="radio-counse"><?php echo $lang['Lang0359']; ?></label>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: left;margin-bottom: 6px;color:#e37222 ; "> 
                    	 <span style="position: relative;left:10px;">I seek at:</span> 
                    	<span style="position: relative;left:232px" id="lookingfor">looking for:</span>  
                    	<span style="position: relative;left:300px" id="prefer2speak">prefer to speak:</span> 
                     </div>

                    <div class="input-unified-search">
                        <div class="input-contain-unified-search">

                            <form id="unified-search-form-inline">
                               <input type="hidden" class="form-control" name="action_type" id="action_type" value="index_search">
                                <input type="hidden" class="form-control" name="from_index" id="from_index" value="1">
                              
                                <input id="location-unified-search" style="display: none" class="location-unified-search ui-autocomplete-input" placeholder="<?php echo $lang['Lang0360']; ?>" type="text" name="CLINIC_SUBURB">
                                
                                 
                                 <select name="DOCTOR_TYPE" id="DOCTOR_TYPE" style="display: none;border-radius: 4px 4px 4px 4px !important;" class="location-unified-search">
                                                <option value=""><?php echo $lang['Lang0388']; ?></option>
                                                <option value="GP"><?php echo $lang['Lang0333']; ?></option>
                                                <option value="Dentist"><?php echo $lang['Lang0334']; ?></option>
                                                <option value="Dietitian"><?php echo $lang['Lang0335']; ?></option>
                                                <option value="Physio"><?php echo $lang['Lang0336']; ?></option>
                                                <option value="Podiatrist"><?php echo $lang['Lang0337']; ?></option>
                                                <option value="Pschologist"><?php echo $lang['Lang0338']; ?></option>
                                                <option value="Chiropractor"><?php echo $lang['Lang0339']; ?></option>
                                                <option value="Audiologist"><?php echo $lang['Lang0340']; ?></option>
                                                <option value="Optometry"><?php echo $lang['Lang0341']; ?></option>
                                                <option value="Skin Doctors"><?php echo $lang['Lang0342']; ?></option>
                                                <option value="Counsellor"><?php echo $lang['Lang0343']; ?></option>
                                            
                                        </select>



                             



                                  <select name="LANGUAGE" id="ddlLanguage" class="location-unified-search" multiple="multiple">
                                

                    
                                 </select>


                                <div tabindex="-1" id="btn_search" style="height: 46px; width:100px; " class="btnSearch"><?php echo $lang['Lang0361']; ?></div>
                            </form>
                        </div>
                    </div>


                </div>




            </div>
            
            <div class="index-second-box">
            
            <!-- <h1 >Our Work:</h1> -->
            
            
            <h2 class="col-sm-12 index-second-heading" style="text-align:center">
            	Where patients meet practices  
  
            </h2>
            	<div class="col-sm-12 index-second-content">            		
            		
            		
            		
            	
					<div class="col-sm-3">
					
					<!-- <ul class="index-second-list"> -->
						<!-- <li>Easy: make an appointment 24*7 </li> -->
						<!-- <li>Confortable: talk to your paractice with your perfered language</li> -->
						
						<!-- <li>Convenient: automatic check in </li> -->
					<!-- </ul> -->
					
					<button tabindex="-1" id="btn_patient_login" style="height: 46px; width:112px; margin-top:20px;line-height: 10px;padding: 9px 12px;" class="btnSearch" >Patient Login</button>

					</div>
          	
          			
           	
           			<div class="col-sm-3" >
            			<img src="images/see-a-doctor.jpg" class="index-second-image">
            		</div>
            	
					<div class="col-sm-3 " >
						<img src="images/gp-1.jpg" class="index-second-image">
					</div>
          		
          		<div class="col-sm-3">					
					<!-- <ul class="index-second-list" style="margin-left: -20px;"> -->
						<!-- <li>simple: let your patients find you just a few clicks</li> -->
						<!-- <li>effective: reduce the time your staff and patients spend on the phone</li> -->
					
						<!-- <li>engage: following and contact with your patients in the community</li> -->
					<!-- </ul> -->
					<h4>Sign up before February for a free 6-month trail.</h4>	
					
					<button tabindex="-1" id="btn_practics_login"  class="btnSearch" style="position:relative ; width:200px; margin-top:20px;line-height: 10px;">Practice Login</button>


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
                    
                    <script src="js/bootstrap.min.js"></script>

                    <script src="js/tm-scripts.js"></script>
                    <script src="js/jquery.cookie.js"></script>
                    <script src="js/bootstrap-multiselect-index.js"></script>
                    <script src="js/jquery-ui.js"></script>

                    


                    <script src="js/main/pub.js"></script>
                    <script src="js/main/index.js"></script>
                    <script type="text/javascript" src="js/main/index_search.js"></script>

    </body>

    </html>