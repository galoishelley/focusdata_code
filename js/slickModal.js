/* 
  Copyright 2016 - Capelle // COdecanyon
 ==================================================== */

 (function ($) {
    $.fn.customSlick = function (options) {

        // Settings
        var settings = $.extend({
            cookieTriggerClass: 'setSlickCookie',
            cookieName: 'slickCookie'
        }, options);

        // Start each popup
        return this.each(function () {
            var self = this,
                pageElements = $('#demoSite')

            // Popup styling
            function popupStyling() {
                $(self).children('.slickWindow').addClass(settings.popupLocation + ' ' + 'animated').css({
                    'width' : settings.popupWidth,
                    'height' : settings.popupHeight,
                    'box-shadow' : settings.popupShadowOffsetX + ' ' + settings.popupShadowOffsetY + ' ' + settings.popupShadowBlurRadius + ' ' + settings.popupShadowSpreadRadius + ' ' + settings.popupShadowColor,
                    'background' : settings.popupBackground,
                    'border-radius' : settings.popupRadius,
                    'margin' : settings.popupMargin,
                    'padding' : settings.popupPadding,
                    '-webkit-animation-duration' : settings.popupAnimationDuration + 's',
                    'animation-duration' : settings.popupAnimationDuration + 's',
                    '-webkit-animation-delay' : (parseFloat(settings.overlayTransitionSpeed) / 2) + 's',
                    'animation-delay' : (parseFloat(settings.overlayTransitionSpeed) / 2) + 's'
                })
                if (settings.popupLocation === 'center') {
                    $(self).children('.slickWindow').css({
                        'margin' : 'auto'
                    })
                } else if ((settings.popupLocation === 'bottomCenter') || (settings.popupLocation === 'topCenter')) {
                    $(self).children('.slickWindow').css({
                        'margin-left' : 'auto',
                        'margin-right' : 'auto'
                    })
                } else if ((settings.popupLocation === 'right') || (settings.popupLocation === 'left')) {
                    $(self).children('.slickWindow').css({
                        'margin-top' : 'auto',
                        'margin-bottom' : 'auto'
                    })
                }
            }

            // Add effect class
            function addEffectClass() {
                $(self).children('.slickWindow').addClass(settings.popupAnimationEffect)
            }

            // Remove effect class
            function removeEffectClass() {
                $(self).children('.slickWindow').removeClass(settings.popupAnimationEffect)
            }

            // Content wrap
            function wrapContent() {
                if (settings.contentAnimate === true) {
                    $(self).children('.slickWindow').children().not('.slickCloseBtn').wrapAll('<div class="slickContent"></div>')
                }
            }

            // Add content animation
            function addContentClass() {
                if (settings.contentAnimate === true) {
                    $(self).find('.slickWindow .slickContent').addClass(settings.contentAnimateEffect + ' ' + 'animated').css({
                        '-webkit-animation-duration' : settings.contentAnimateSpeed + 's',
                        'animation-duration' : settings.contentAnimateSpeed + 's',
                        '-webkit-animation-delay' : settings.contentAnimateDelay + 's',
                        'animation-delay' : settings.contentAnimateDelay + 's'
                    })
                }
            }

            // Remove content animation
            function removeContentClass() {
                if (settings.contentAnimate === true) {
                    $(self).find('.slickWindow .slickContent').removeClass(settings.contentAnimateEffect)
                }
            }

            // Page blur
            function beginBluring() {
                pageElements.addClass('blurred').css({
                    '-webkit-filter' : 'blur' + '(' + settings.blurBgRadius + ')',
                    'filter' : 'blur' + '(' + settings.blurBgRadius +')',
                    '-webkit-transform' : '',
                    'transform' : ''
                })
            }

            // Page scale
            function beginScaling() {
                pageElements.addClass('scaled').css({
                    '-webkit-transform' : 'scale' + '(' + settings.scaleBgValue + ')',
                    'transform' : 'scale' + '(' + settings.scaleBgValue + ')',
                    '-webkit-filter' : '',
                    'filter' : ''
                })
            }

            // Start page effects
            function startPageEffects() {
                if (settings.pageEffect === 'blur') {
                    beginBluring()
                } else if (settings.pageEffect === 'scale') {
                    beginScaling()
                } else if (settings.pageEffect === 'both') {
                    beginBluring();
                    beginScaling()
                }
                if ((settings.pageEffect === 'blur') || (settings.pageEffect === 'scale') || (settings.pageEffect === 'both')) {
                    pageElements.css({
                       '-webkit-transition-duration' : settings.overlayTransitionSpeed + 's',
                       'transition-duration' : settings.overlayTransitionSpeed + 's'
                    })
                }
            }

            // Remove page effects
            function endPageEffects() {
                if ((pageElements.hasClass('blurred')) || (pageElements.hasClass('scaled'))) {
                    pageElements.removeClass('blurred scaled').css({
                        '-webkit-transform' : '',
                        'transform' : '',
                        '-webkit-filter' : '',
                        'filter' : ''
                    })
                }
            }

            // Overlay styling
            function showOverlay() {
                if (settings.overlayBg === true) {
                    $(self).children('.slickOverlay').css({
                        'background' : settings.overlayBgColor,
                        '-webkit-transition-duration' : settings.overlayTransitionSpeed + 's',
                        'transition-duration' : settings.overlayTransitionSpeed + 's'
                    })
                }
            }
            
            // Close modal on ESC key press
            function activateESC() {
                if (settings.enableESC === true) {
                    $(window).bind('keydown', function(e) {
                        if (e.keyCode === 27) {
                            disableSlick()
                        }
                    })
                }
            }
            
            // After init
            function slickOnLoad() {
                if (settings.onSlickLoad !== undefined) {
                    settings.onSlickLoad()
                }
            }

            // Before init
            function slickOnClose() {
                if (settings.onSlickClose !== undefined) {
                    settings.onSlickClose()
                }
            }

            // Add transition delays
            function addDelays() {
                $(self).css({
                    '-webkit-transition-duration' : settings.overlayTransitionSpeed + 's',
                    'transition-duration' : settings.overlayTransitionSpeed + 's'
                });
            }

            // Enable slick
            function enableSlick() {
                $(self).addClass('isActive');
                startPageEffects();
                addEffectClass();
                addContentClass();
                slickOnLoad();
            }

            // Disable slick
            function disableSlick() {
                $(self).removeClass('isActive');
                endPageEffects();
                removeEffectClass();
                removeContentClass();
                slickOnClose();
            }

            // Activate the modal
            addDelays();
            showOverlay();
            activateESC();
            popupStyling();
            wrapContent();
            // Close the modal
            $(self).find('.closeModal').on('click', function() {
                disableSlick()
            });

            // Page effects
            function enablePageEffects() {
                if (pageEffect.val() === 'blur') {
                    setTimeout(beginBluring, delayTime.val() * 1000);
                } else if (pageEffect.val() === 'scale') {
                     setTimeout(beginScaling, delayTime.val() * 1000);
                } else if (pageEffect.val() === 'none') {
                    pageElements.removeAttr('style')
                }
            }

            // Custom inputs
            $('#customPreview :input').each(function() {
                popupType1 = $('#delayedType')
                popupType2 = $('#exitType')
                delayTime = $('#cDelayTime')
                exitTopDistance = $('#cExitDist')
                setCookie = $('#cookieYes')
                cookieDays = $('#cCookieDays')
                cookieName = $('#cCookieName')
                overlayBg = $('#overlayYes')
                overlayClose = $('#overlayClosesYes')
                pageEffect = $('#cpageEffect')
                popupEffect = $('#cEffect')
                contentEffect = $('#cContentEffect')
                cContentSpeed = $('#cContentSpeed')
                cContentDelay = $('#cContentDelay')
                $(this).on('change', function() {
                    console.log($(this).val())
                    if (popupType1.prop('checked') === true) {
                        $('#cDelayTime').removeClass('notActive')
                        $('#cExitDist').addClass('notActive')
                    } else {
                        $('#cDelayTime').addClass('notActive')
                        $('#cExitDist').removeClass('notActive')
                    }
                    if (setCookie.prop('checked') === true) {
                        $('#cCookieDays, #cCookieName').removeClass('notActive')
                    } else {
                        $('#cCookieDays, #cCookieName').addClass('notActive')
                    }
                    if (overlayBg.prop('checked') === true) {
                        $('#cOverlayClose, #cOverlayColor, #cOverlaySpeed').removeClass('notActive');
                        $('#cOverlayColor').siblings('.minicolors-swatch').removeClass('notActive');
                    } else {
                        $('#cOverlayClose, #cOverlayColor, #cOverlaySpeed').addClass('notActive');
                        $('#cOverlayColor').siblings('.minicolors-swatch').addClass('notActive');
                    }
                    return $(this).val()
                })
            })

            // Reopen the modal
            $('#openCustomPopup').on('click', function() {
                // Popup type
                if (popupType1.prop('checked') === true) {
                    $(document).off('mousemove');
                    setTimeout(enableSlick, delayTime.val() * 1000);
                    enablePageEffects()
                } else {
                    var oldPosition = -1;
                    $(document).mousemove(function(e) {
                        var newPosition = e.pageY - $(window).scrollTop();
                        if (newPosition < exitTopDistance.val()) {
                            if (oldPosition != -1) {
                                if (newPosition < oldPosition) {
                                    enableSlick()
                                    enablePageEffects()
                                }
                                oldPosition = newPosition
                            } else {
                                oldPosition = newPosition
                            }
                        } else {
                            oldPosition = -1
                        }
                    });
                }
                // Cookies
                days = cookieDays.val();
                now = new Date();
                now.setTime(now.getTime() + (days * 24 * 60 * 60 * 1000));
                if (setCookie.prop('checked') === true) {
                    document.cookie = cookieName.val() + '=true; path='/'; expires=' + now.toGMTString();
                    alert('Slick cookie with a name ' + cookieName.val()  + ' is now set. It will be active for ' + days + ' days and can be used to hide a modal from your visitors or other actions.')
                }
                // Overlay
                if (overlayBg.prop('checked') === true) {
                    $('#customOverlay').show()
                } else {
                    $('#customOverlay').hide()
                }
                if (overlayClose.prop('checked') === true) {
                    $('#customOverlay').css({'cursor':'pointer'}).on('click', function() {
                        disableSlick()
                    })
                } else {
                    $('#customOverlay').off().css({'cursor':'auto'})
                }
                // Popup animation
                settings.popupAnimationEffect = $(popupEffect).val()
                // Content animation
                settings.contentAnimateEffect = $(contentEffect).val()
                settings.contentAnimateSpeed = $(cContentSpeed).val()
                settings.contentAnimateDelay = $(cContentDelay).val()
            });

        });
    }
}(jQuery));

// Custom modal invoke
$(document).ready(function() {

    var custPopSel = '#customPopup';
    cOverlaySpeed = $('#cOverlaySpeed')
    cOverlayColor = $('#cOverlayColor')
    cRadius = $('#cRadius')
    cMargin = $('#cMargin')
    cPadding = $('#cPadding')
    cWidth = $('#cWidth')
    cHeight = $('#cHeight')
    cLocation = $('#cLocation')
    cDuration = $('#cDuration')
    cShadow = $('#cShadow')
    cPopupColor = $('#cPopupColor')
    cContentSpeed = $('#cContentSpeed')
    cClose = $('#cClose')

    // Init settings
    $(custPopSel).customSlick({
        popupType: '',
        delayTime: 0,
        exitTopDistance: 100,
        setCookie: false,
        overlayBg: true,
        overlayClosesModal: true,
        overlayBgColor: 'rgba(0,0,0,0.85)',
        overlayTransitionSpeed: '0.4',
        pageEffect: 'none',
        blurBgRadius: '1px',
        scaleBgValue: '0.9',
        popupWidth: '480px',
        popupHeight: '280px',
        popupLocation: 'bottomRight',
        popupAnimationDuration: '0.4',
        popupAnimationEffect: 'slideBottom',
        popupShadowOffsetX: '0',
        popupShadowOffsetY: '0',
        popupShadowBlurRadius: '20px',
        popupShadowSpreadRadius: '0',
        popupShadowColor: 'rgba(0,0,0,0.4)',
        popupBackground: '#fff',
        popupRadius: '4px',
        popupMargin: '30px',
        popupPadding: '30px',
        contentAnimate: true,
        contentAnimateEffect: 'slideBottom',
        contentAnimateSpeed: '0.4',
        contentAnimateDelay: '0.4',
        videoSupport: true,
        videoAutoPlay: true,
        videoStopOnClose: true,
        addCloseButton: true,
        buttonStyle: 'icon',
        enableESC: true,
        onSlickLoad: function() {
            console.log("Slick is visible")
        },
        onSlickClose: function() {
            console.log("Slick is hidden")
        }
    });

    $('#customPreview :input').on('input change', function() {
        $(this).siblings('.val').find('span').text($(this).val())
    });

    // Text color
    function getRGB(str){
        var match = str.match(/rgba?\((\d{1,3}), ?(\d{1,3}), ?(\d{1,3})\)?(?:, ?(\d(?:\.\d?))\))?/);
        return match ? {
            red: match[1],
            green: match[2],
            blue: match[3]
        } : {};
    }
    
    var cWinSel = $(custPopSel).find('.slickWindow');
    
    $(cOverlaySpeed).on('change', function() {
        $(custPopSel).css({
            '-webkit-transition-duration': cOverlaySpeed.val() + 's',
            'transition-duration': cOverlaySpeed.val() + 's'
        })
        $(custPopSel).find('.slickOverlay').css({
            '-webkit-transition-duration': cOverlaySpeed.val() + 's',
            'transition-duration': cOverlaySpeed.val() + 's'
        })
        cWinSel.css({
            '-webkit-animation-delay': cOverlaySpeed.val() + 's',
            'animation-delay': cOverlaySpeed.val() + 's'
        })
        $('#demoSite').css({
            '-webkit-transition-duration': cOverlaySpeed.val() + 's',
            'transition-duration': cOverlaySpeed.val() + 's'
        })
    });
    $(cOverlayColor).on('change', function() {
        $(custPopSel).find('.slickOverlay').css({
            'background': cOverlayColor.val()
        })
    });
    $(cWidth).on('change', function() {
        cWinSel.css({
            'width': cWidth.val() + 'px'
        })
    });
    $(cHeight).on('change', function() {
        cWinSel.css({
            'height': cHeight.val() + 'px'
        })
    });
    $(cLocation).on('change', function() {
        cWinSel.removeClass('bottomRight bottomCenter bottomLeft left center right topRight topCenter topLeft').addClass($(this).val())
        if ($(this).val() === 'center') {
            cWinSel.css({
                'margin' : 'auto'
            })
        } else if (($(this).val() === 'bottomCenter') || ($(this).val() === 'topCenter')) {
            cWinSel.css({
                'margin-left' : 'auto',
                'margin-right' : 'auto'
            })
        } else if (($(this).val() === 'right') || ($(this).val() === 'left')) {
            cWinSel.css({
                'margin-top' : 'auto',
                'margin-bottom' : 'auto'
            })
        } else {
            cWinSel.css({
                'margin': cMargin.val() + 'px'
            })
        }
    });
    $(cDuration).on('change', function() {
        cWinSel.css({
            '-webkit-animation-duration': cDuration.val() + 's',
            'animation-duration': cDuration.val() + 's'
        })
    });
    $(cShadow).on('change input', function() {
        cWinSel.css({
            'box-shadow': cShadow.val()
        })
    });
    $(cPopupColor).on('change', function() {
        cWinSel.css({
            'background': cPopupColor.val()
        });
        var r = getRGB($(this).val()).red;
        var g = getRGB($(this).val()).green;
        var b = getRGB($(this).val()).blue;
        var total = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        if (total >= 128) {
            $(custPopSel).find('.slickContent').css({
                'color': '#000'
            })
        } else {
            $(custPopSel).find('.slickContent').css({
                'color': '#fff'
            })
        }
    });
    $(cRadius).on('change', function() {
        cWinSel.css({
            'border-radius': cRadius.val() + 'px'
        })
    });
    $(cMargin).on('change', function() {
        cWinSel.css({
            'margin': cMargin.val() + 'px'
        })
    });
    $(cPadding).on('change', function() {
        cWinSel.css({
            'padding': cPadding.val() + 'px'
        })
    });
    $(cClose).on('change', function() {
        cWinSel.find('.slickCloseBtn').removeClass('labeled tag icon text circle').addClass($(cClose).val())
    });

    $('#resetFrom').on('click', function() {
        $('#customPreview')[0].reset().trigger('change');
    })

});

// jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/ | Copyright 2008 George McGinley Smith
jQuery.extend(jQuery.easing, {
	easeInOutExpo: function(e, t, n, r, i) {
		if (t == 0) return n;
		if (t == i) return n + r;
		if ((t /= i / 2) < 1) return r / 2 * Math.pow(2, 10 * (t - 1)) + n;
		return r / 2 * (-Math.pow(2, -10 * --t) + 2) + n
	}
})

// Scroll to content
$("a.next").bind("click", function(e) {
	var anchor = $(this);
	$("html, body").stop().animate({
		scrollTop: parseInt($(anchor.attr("href")).offset().top - 20, 0)
	}, 1e3, "easeInOutExpo");
	e.preventDefault()
});

// Intro text fade out
$(window).scroll(function() {
	$("#first .wrap").css({
		'opacity': 1 - (($(this).scrollTop()) / 300)
	});
	var topDist = $(document).scrollTop();
	$('#first .wrap').css('margin-top', (topDist / 50) * 9);
});

// Section accordion
$('#customPreview .subtitle').each(function() {
	$(this).click(function() {
		if ($(this).next().is(":visible")) {
			$(this).next().slideDown(800, 'easeInOutExpo');
			return false
		}
		$('#customPreview .subtitle').next().filter(':visible').slideUp(800, 'easeInOutExpo');
		$(this).next().slideDown(800, 'easeInOutExpo');
		$(this).siblings(this).removeClass('active');
		$(this).addClass('active');
	})
});