$(function () {
    $('.type-unified-search').on('resetactive', function (e) {
        $('.icons-act.active, .ius-act.active').not(this).trigger('deactivated', [true]);
        $('.type-unified-search').removeClass('tactive');
        
  
    }).on('click', '.icons-act:not(.icons-sp)', function (e, nofocus) {
        $(this).trigger('toggleactive', [nofocus]);
        if ($(window).width() < 768) {
            $('html, body').animate({
                'scrollTop': $('.box-unified-search').offset().top
            });
        }
        e.stopPropagation();
        e.preventDefault();
    }).on('mouseenter', '.icons-sp', function (e, nofocus) {
        if (!$(this).hasClass('stickypopup')) {
            $(this).one('mouseleave.popup', function (e) {
                $(this).trigger('popdown', [nofocus]);
                if ($(this).hasClass('pactive')) {
                    $('.type-unified-search').addClass('tactive');
                }
            });
        }
        $(this).trigger('popup', [nofocus]);
    }).on('click', '.icons-sp', function (e) {
        $(this).off('mouseleave.popup');
        if ($(this).hasClass('active')) {
            if (!$(this).hasClass('stickypopup')) {
                $(this).addClass('stickypopup');
            } else {
                $(this).trigger('popdown');
            }
        } else {
            $(this).trigger('popup');
            $(this).addClass('stickypopup');
        }
        e.stopPropagation();
        e.preventDefault();
    }).on('click', '.ius-act', function (e, nofocus) {
        $(this).trigger('toggleactive', [nofocus]);
        e.stopPropagation();
        e.preventDefault();
    }).on('toggleactive', '.icons-act:not(.icons-sp)', function (e, nofocus) {
        if ($(this).hasClass('active')) {
            $(this).trigger('deactivated', [nofocus]);
            $('.type-unified-search').removeClass('tactive');
           
           
            //$('#location-unified-search').attr('placeholder', 'Suburb, Practitioner, Practice or Procedure');
        } else {
            $(this).trigger('activated', [nofocus]);
            $('.type-unified-search').addClass('tactive');
           
          
            //$('#location-unified-search').attr('placeholder', 'Suburb, Practice or Practitioner');
        }
    }).on('activated', '.icons-act:not(.icons-sp)', function (e, nofocus) {
        e.stopPropagation();
        $('.icons-act.active, .ius-act.active').not(this).trigger('deactivated');
        $(this).addClass('active');
        $(this).children('input:radio').prop('checked', true).trigger('change', [nofocus]);
    }).on('deactivated', '.icons-act:not(.icons-sp)', function (e, nofocus) {
        e.stopPropagation();
        $(this).children('input:radio').prop('checked', false).trigger('change', [nofocus]);
        $(this).removeClass('active');
    }).on('activated', '.icons-sp', function (e, data) {
        data = data || {
            'text': 'More',
            'icon': ''
        };
        e.stopPropagation();
        $(this).data('current', data);
        $(this).addClass('pactive');
        $(this).find('.icons-sp-text').text(data.text || 'More');
        $(this).find('.icons-sp-icon').attr('id', data.icon || '');
    }).on('deactivated', '.icons-sp', function (e, temporary) {
        e.stopPropagation();
        $(this).removeClass('pactive');
        $(this).find('.icons-sp-text').text("More");
        $(this).find('.icons-sp-icon').attr('id', "");
        if (temporary !== true) {
            $(this).data('current', null);
        }
        if ($('html').hasClass('ismobileonly') && $('html').hasClass('touchevents')) {
            $('#select-unified-search').val('no-select');
        }
    }).on('toggleactive', '.ius-act', function (e, nofocus) {
        if ($(this).hasClass('active')) {
            $(this).trigger('deactivated', [nofocus]);
            $('.type-unified-search').removeClass('tactive');
        } else {
            $(this).trigger('activated', [nofocus]);
            $('.type-unified-search').addClass('tactive');
        }
    }).on('activated', '.ius-act', function (e, nofocus) {
        e.stopPropagation();
        $('.icons-act.active, .ius-act.active').not(this).trigger('deactivated');
        var data = {
            'text': $(this).find('label').text(),
            'icon': $(this).children('input:radio').attr('id') + '-icon'
        };
        $(this).parents('.icons-sp:first').trigger('activated', [data]).trigger('popdown');
        $(this).addClass('active');
        $(this).children('input:radio').prop('checked', true).trigger('change', [nofocus]);
    }).on('deactivated', '.ius-act', function (e, nofocus) {
        e.stopPropagation();
        $(this).parents('.icons-sp:first').trigger('deactivated').trigger('popdown');
        $(this).removeClass('active');
        $('.type-unified-search').removeClass('tactive');
        $(this).children('input:radio').prop('checked', false).trigger('change', [nofocus]);
    }).on('togglepopup', '.icons-sp', function (e) {
        $(this).trigger($(this).hasClass('active') ? 'popdown' : 'popup');
        e.stopPropagation();
    }).on('popup', '.icons-sp', function (e) {
        e.stopPropagation();
        $('.icons-sp.active').not(this).trigger('popdown');
        if ($('html').hasClass('ismobileonly') && $('html').hasClass('touchevents')) {
            $(this).find('.ius-act.active').trigger('deactivated');
            $('#select-unified-search').val('').removeClass('hide').trigger('openselect');
        } else {
            $(this).trigger('deactivated', [true]);
            $(this).addClass('active');
        }
    }).on('popdown', '.icons-sp', function (e) {
        $(this).off('mouseleave.popup');
        $(this).removeClass('active').removeClass('stickypopup');
        if ($(this).data('current')) {
            $(this).trigger('activated', $(this).data('current'));
        }
        e.stopPropagation();
    }).on('change', '#select-unified-search', function (e) {
        var thisusval = $(this).val();
        $('.ius-act #' + thisusval).parents('.ius-act:first').trigger('toggleactive');
    });

    
    $(document).on('click', function (e) {
        if (!$(e.target).hasClass('new-search-btn-click') && $(e.target).parents('.box-unified-search').length === 0) {
            $('.input-unified-search').removeClass('showing pill');
        }
    });
    $(document).on('click focusin', '.fakebtn-unified-search, #location-unified-search', function (e) {
        if ($(window).width() < 768) {
            e.preventDefault();
            e.stopImmediatePropagation();
            $('#location-unified-search-pop').focus();
            $('.global-sticky-search').addClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function (e) {
                if (e.target == this) {
                    $('body').addClass('fx-body-wrap').scrollTop(0);
                    $(this).addClass('transition-end');
                }
            });
        } else {
            if ($('.input-results-unified-search').hasClass("show-all-keywords")) {
                $('#unified-search-form-inline :input[name=search]').trigger('change', [true]);
            }
        }
    });
    $('.search-head-trigger').on('click', function (e) {
        e.preventDefault();
        $('.global-sticky-search').removeClass('is-visible').one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function (e) {
            if (e.target == this) {
                $('body').removeClass('fx-body-wrap');
                $(this).removeClass('transition-end');
            }
        });
        return false;
    });
    $('.inputcross-unified-search').on('click', function (e) {
        $(this).prevAll(':input[name=search]').val('');
        $(document).trigger('dismiss-unified-search-pill');
        $('.input-unified-search').removeClass('showing');
        $(this).removeClass("showing");
        if ($('.search-header-left').length) {
            $('#location-unified-search').css({
                'padding-left': '40px',
                'width': '100%'
            });
        }
    });
    $('.type-unified-search').on('openselect', '#select-unified-search', function (e) {
        e.stopPropagation();
        if (document.createEvent) {
            var ev = document.createEvent("MouseEvents");
            ev.initMouseEvent("mousedown", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
            this.dispatchEvent(ev);
        } else if (this.fireEvent) {
            this.fireEvent("onmousedown");
        }
        return false;
    });

    var specialty_index = {
        'General Practice': {
            'search': 'GP',
            'value': 'gp',
            'id': 'gp',
            'short': 'gp',
            'text': 'GP'
        },
        'Dentistry': {
            'search': 'Dentist',
            'value': 'dentist',
            'id': 'dentist',
            'short': 'dt',
            'text': 'Dentist'
        },
        'Physiotherapy': {
            'search': 'Physiotherapist',
            'value': 'physiotherapist',
            'id': 'physio',
            'short': 'ph',
            'text': 'Physio'
        },
        'Chiropractic': {
            'search': 'Chiropractor',
            'value': 'chiropractor',
            'id': 'chiro',
            'short': 'ch',
            'text': 'Chiropractor'
        },
        'Psychology': {
            'search': 'Psychologist',
            'value': 'psychologist',
            'id': 'psycho',
            'short': 'ps',
            'text': 'Psychologist'
        },
        'Radiology': {
            'search': 'Radiologist',
            'value': 'radiologist',
            'id': 'radio',
            'short': 'radio',
            'text': 'Radiologist',
            'nomore': true,
            'menuitems': [{
                'search': 'X-Ray',
                'value': 'xray',
                'id': 'xray',
                'short': 'xray',
                'text': 'X-Ray'
            }, {
                'search': 'CT-Scan',
                'value': 'ctscan',
                'id': 'ctscan',
                'short': 'ctscan',
                'text': 'CT-Scan'
            }, {
                'search': 'MRI',
                'value': 'mri',
                'id': 'mri',
                'short': 'mri',
                'text': 'MRI'
            }, {
                'search': 'Ultrasound',
                'value': 'ultra',
                'id': 'ultra',
                'short': 'ultra',
                'text': 'Ultrasound'
            }]
        },
        'Audiology': {
            'search': 'Audiologist',
            'value': 'audiologist',
            'id': 'audio',
            'short': 'audio',
            'text': 'Audiologist'
        },
        'Podiatry': {
            'search': 'Podiatrist',
            'value': 'podiatrist',
            'id': 'podia',
            'short': 'podia',
            'text': 'Podiatrist'
        },
        'Counselling': {
            'search': 'Counsellor',
            'value': 'counsellor',
            'id': 'counse',
            'short': 'counse',
            'text': 'Counsellor'
        },
        'Skin Cancer': {
            'search': 'Skin Checks',
            'value': 'skinchecks',
            'id': 'skin',
            'short': 'skin',
            'text': 'Skin Checks'
        },
        'Optometry': {
            'search': 'Optometrist',
            'value': 'optometry',
            'id': 'opto',
            'short': 'opto',
            'text': 'Optometry'
        }
    };
    $('.type-unified-search').on('reorder', function (e, data) {
        var buttons = $(document.createDocumentFragment());
        var menu = $(document.createDocumentFragment());
        var select = $('<select tabindex="-1" id="select-unified-search" class="visual-hide">').append('<option value="" disabled>Select option</option>');
        $.each(data, function (idx, spec) {
            var button_config = specialty_index[spec];
            if (idx <= 4) {
                if (button_config.menuitems) {
                    var submenu = $(document.createDocumentFragment());
                    $.each(button_config.menuitems, function (idx, button_config) {
                        $('<span class="ius-act"/>').append($('<input name="search-option-type" class="hide" type="radio" />').attr('value', button_config.value).data('search', button_config.search).data('searchtext', button_config.text).data('icon', button_config.short).attr('id', 'radio-' + button_config.id)).append($('<label/>').text(button_config.text).attr('class', 'radio-' + button_config.id).attr('for', 'radio-' + button_config.id)).appendTo(submenu);
                    });
                    $('<div class="icons-unified-search icons-act icons-sp"/>').addClass('icons-' + button_config.short).append($('<span class="icons-image icons-sp-icon"/>').attr('id', 'radio-' + button_config.short + '-icon')).append($('<label class="icons-text icons-sp-text"/>').text(button_config.text)).append($('<div class="icons-sp-search"/>').append(submenu)).data('original', {
                        'text': button_config.text,
                        'icon': 'radio-' + button_config.short + '-icon'
                    }).appendTo(buttons);
                } else {
                    $('<div class="icons-unified-search icons-act"/>').addClass('icons-' + button_config.short).append($('<input name="search-option-type" class="hide" type="radio" />').attr('id', 'radio-' + button_config.id).attr('value', button_config.value).data('search', button_config.search).data('searchtext', button_config.text).data('icon', button_config.short)).append('<span class="icons-image"/>').append($('<label class="icons-text"/>').text(button_config.text).attr('for', 'radio-' + button_config.id)).appendTo(buttons);
                }
            }
            if (idx >= 3 && !button_config.nomore) {
                if (button_config.menuitems) {
                    $.each(button_config.menuitems, function (idx, button_config) {
                        $('<span class="ius-act"/>').addClass(idx <= 4 ? 'ius-mob' : '').append($('<input name="search-option-type" class="hide" type="radio" />').attr('value', button_config.value).data('search', button_config.search).data('searchtext', button_config.text).data('icon', button_config.short).attr('id', 'radio-' + button_config.id)).append($('<label/>').text(button_config.text).attr('class', 'radio-' + button_config.id).attr('for', 'radio-' + button_config.id)).appendTo(menu);
                        if ($('html').hasClass('ismobileonly') && $('html').hasClass('touchevents')) {
                            $('<option/>').attr('value', 'radio-' + button_config.id).text(button_config.text).appendTo(select);
                        }
                    });
                } else {
                    $('<span class="ius-act"/>').addClass(idx <= 4 ? 'ius-mob' : '').append($('<input name="search-option-type" class="hide" type="radio" />').attr('value', button_config.value).data('search', button_config.search).data('searchtext', button_config.text).data('icon', button_config.short).attr('id', 'radio-' + button_config.id)).append($('<label/>').text(button_config.text).attr('class', 'radio-' + button_config.id).attr('for', 'radio-' + button_config.id)).appendTo(menu);
                    if ($('html').hasClass('ismobileonly') && $('html').hasClass('touchevents')) {
                        $('<option/>').attr('value', 'radio-' + button_config.id).text(button_config.text).appendTo(select);
                    }
                }
            }
        });
        $('<div class="icons-unified-search icons-act icons-sp icons-more"/>').append('<span class="icons-image icons-sp-icon"></span>').append('<label class="icons-text icons-sp-text">More</label>').append($('<div class="icons-sp-search"/>').html(menu)).data('original', {
            'text': 'More',
            'icon': ''
        }).appendTo(buttons);
        if ($('html').hasClass('ismobileonly') && $('html').hasClass('touchevents')) {
            select.appendTo(buttons);
        }
        $(this).html(buttons);
    });
    $('.search-pill-us').on('reorder', function (e, data) {
        var keywords = [];
        $.each(data, function (idx, spec) {
            if (spec in specialty_index) {
                var button_config = specialty_index[spec];
                if (button_config.menuitems) {
                    $.each(button_config.menuitems, function (i, s) {
                        keywords.push({
                            'text': s.search,
                            'type': 'appointment'
                        })
                    })
                } else {
                    keywords.push({
                        'text': button_config.search,
                        'type': 'appointment'
                    });
                }
            }
        });
        $(this).data('suggest-keywords', {
            'keyword': keywords
        });
    });

    var requestcount = 0,
        responsecount = 0;
    var searchcache = {};
    var originalTerm = $.trim($('#unified-search-form-inline input[name=search]').val());
    var originalKeyword = $.trim($('#unified-search-form-inline input[name=keyword]').val());

    $(document).on('updatecontent', '.pill-us, .pill-us-mob', function updatecontent(e, data) {
        e.stopPropagation();
        var pill = $(this);
        var form = $(this).parents('form:first');
        var $lusInput = form.find('input[name=search]');
        var winWidth = $(window).width();
        var pillpadWidth = (winWidth < 768 ? 27 : 46);
        form.find('input[name=keyword]').val(data.searchterm || '');
        if (data.type == 'appointment' && pill.find('.cross-unified-search-spec').length > 0) {
            pill.find('.cross-unified-search-spec').text(data.searchtext || data.searchterm)
            if (!$('.search-header-left').length) {
                $lusInput.css('padding-left', pill.outerWidth(true));
            }
        } else {
            var icon = data.icon ? data.icon + '-pill' : (data.type === 'location' ? 'local-pill' : 'intproc-pill');
            if ($('.search-header-left').length) {
                pill.text(data.searchtext || data.searchterm).wrapInner($('<span class="cross-unified-search-spec"/>'));
                pill.append('<span class="cross-unified-search-dwnar"/><span class="cross-unified-search-xtxt"> appointments in </span><span class="cross-unified-search"></span>');
            } else {
                pill.text(data.searchtext || data.searchterm).prepend($('<span class="pico-unified-search"/>').addClass(icon)).append('<span class="cross-unified-search"/>');
            }
            if ($('.search-header-left').length) {
                $('#location-unified-search').css({
                    'padding-left': '',
                    'width': ''
                });
            }
            if (pill.hasClass('pill-us-mob')) {
                if (data.searchterm) {
                    pill.css('display', 'inline-block');
                } else {
                    pill.css('display', 'none');
                }
            }
            if (data.searchterm && data.hidden !== true) {
                pill.show();
                if (!$('.search-header-left').length) {
                    $lusInput.css('padding-left', pill.outerWidth(true) + 15);
                }
            } else {
                pill.hide();
                if (!$('.search-header-left').length) {
                    $lusInput.css('padding-left', pillpadWidth);
                }
            }
        }
        if (data.type === 'location' && data.searchterm) {
            $lusInput.attr('placeholder', 'Practitioner, Practice or Procedure');
        } else {
            if ($(window).width() >= 768) {
                $('#location-unified-search').focus();
            } else if (!('init' in data && data.init)) {
                $('.fakebtn-unified-search').trigger('focusin');
            }
        }
        if (data.type != 'appointments' && $.trim(data.searchterm)) { }
    });
    $(document).on('click', '.gotourl', function (e) {
        if ($(this).data('url')) {
            e.stopPropagation();
            location.href = $(this).data('url');
        }
    });
    $(document).on('click', '.keyword', function (e) {
        e.stopPropagation();
        $('#unified-search-form-inline .pill-us, #unified-search-form-popup .pill-us-mob').trigger('updatecontent', [{
            'searchterm': $(this).data('keyword'),
            'searchtext': $(this).data('keyword'),
            'type': $(this).data('keyword-type') || 'search',
            'hidden': false
        }]);
        if ($('.global-sticky-search').hasClass('is-visible')) {
            $('#unified-search-form-popup :input[name=search]').val('').change().focus();
        } else if ($('.input-results-unified-search').hasClass("show-all-keywords")) {
            $('#unified-search-form-inline :input[name=search]').change();
        } else {
            $('#unified-search-form-inline :input[name=search]').val('').change();
        }
    });
    $(document).on('click', '.pill-us .cross-unified-search, .pill-us-mob .cross-unified-search', function (e) {
        $(document).trigger('dismiss-unified-search-pill');
        e.stopPropagation();
        return false;
    }).on('click', '.search-pill-us', function (e) {
        $('.input-unified-search').addClass('showing');
        $('.input-results-unified-search').trigger('updatesuggestions', [$(this).data('suggest-keywords'), true]);
    }).on('dismiss-unified-search-pill', function (e, nofocus) {
        e.stopPropagation();
        $('.type-unified-search').trigger('resetactive');
        $('#unified-search-form-inline .pill-us, #unified-search-form-popup .pill-us-mob').trigger('updatecontent', [{
            'searchterm': '',
            'searchtext': '',
            'type': 'search',
            'hidden': true
        }]);
        if (nofocus !== true && $(window).width() >= 768) {
            if ($('.global-sticky-search').hasClass('is-visible')) {
                $('#unified-search-form-popup :input[name=search]').focus().change();
            } else {
                $('#unified-search-form-inline :input[name=search]').focus().change();
            }
        }
        $('#unified-search-form-popup').change();
        return false;
    });
    $(document).on('change', '.icons-unified-search :radio', function changeradio(e, nofocus) {
        e.stopPropagation();
        $('#unified-search-form-inline .pill-us, #unified-search-form-popup .pill-us-mob').trigger('updatecontent', [{
            'searchterm': $(this).prop('checked') ? $(this).data('search') : '',
            'searchtext': $(this).prop('checked') ? ($(this).data('searchtext') || $(this).data('searchtext')) : '',
            'icon': $(this).prop('checked') ? $(this).data('icon') : 'intproc',
            'type': 'search',
            'hidden': false
        }]);
        if (nofocus !== true && $(window).width() >= 768) {
            $('#unified-search-form-inline :input[name=search]').focus();
        }
    });
    var SECTION_BONUS = 0;
    var MAX_RESULTS = 6;
    var COUNTS = {
        'search': 3,
        'keyword': 3,
        'practice': 2,
        'practitioner': 2,
    };
    $('.input-results-unified-search').on('updatesearchtext', function (e, search) {
        var text = $.trim(search.keyword + ' ' + search.text);
        if (text === '') {
            $(this).find('.sect-type-search').hide();
        } else {
            $(this).find('.sect-type-search').show().find('.unified-search-term').text(text);
        }
    });
    $(document).on('click', '.unified-search-text-search', function (e) {
        e.stopPropagation();
        location.href = '/find/text/Australia/?search=' + encodeURIComponent($(this).find('span.unified-search-term').text());
        return false;
    });
    
    


});;