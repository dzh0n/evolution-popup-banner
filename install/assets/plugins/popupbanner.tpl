//<?php
/**
 * PopupBanner
 *
 * <strong>1.0.2</strong> @category plugin
 *
 * @category    plugin
 * @internal    @events OnLoadWebDocument
 * @internal    @modx_category PopupBanner
 * @internal    @properties
 * @internal    @disabled 0
 * @internal    @installset base
 */

if ($modx->event->name == 'OnLoadWebDocument') {
    $cfg = isset($modx->config) && is_array($modx->config) ? $modx->config : array();

    $get = function ($key, $default = '') use ($cfg) {
        $full = 'client_' . $key;
        return array_key_exists($full, $cfg) ? $cfg[$full] : $default;
    };

    $enabled = (string)$get('popup_banner_enabled', '0');
    $image = trim((string)$get('popup_banner_image', ''));

    if ($enabled === '1' && $image !== '') {
        $delay = max(0, (int)$get('popup_banner_delay', 3));
        $mode = (string)$get('popup_banner_mode', 'repeat');
        if (!in_array($mode, array('every_page', 'once', 'repeat'), true)) $mode = 'repeat';

        $repeatValue = max(1, (int)$get('popup_banner_repeat_value', 1));
        $repeatUnit = (string)$get('popup_banner_repeat_unit', 'days');
        if (!in_array($repeatUnit, array('minutes', 'hours', 'days'), true)) $repeatUnit = 'days';

        $version = trim((string)$get('popup_banner_version', '1'));
        if ($version === '') $version = '1';

        $link = trim((string)$get('popup_banner_link', ''));
        $newTab = (string)$get('popup_banner_new_tab', '0') === '1';
        $closeOverlay = (string)$get('popup_banner_close_overlay', '1') === '1';

        if (strpos($image, '/') !== 0 && !preg_match('~^https?://~i', $image)) {
            $image = MODX_BASE_URL . ltrim($image, '/');
        }

        $data = array(
            'image' => $image,
            'link' => $link,
            'newTab' => $newTab,
            'delay' => $delay,
            'mode' => $mode,
            'repeatValue' => $repeatValue,
            'repeatUnit' => $repeatUnit,
            'version' => $version,
            'closeOverlay' => $closeOverlay
        );

        $json = json_encode($data);
        if ($json !== false) {
            $modx->regClientCSS(MODX_BASE_URL . 'assets/plugins/popupbanner/css/popupbanner.css?v=1.0.2');
            $modx->regClientHTMLBlock('<script>window.PopupBannerConfig=' . $json . ';</script>');
            $modx->regClientScript(MODX_BASE_URL . 'assets/plugins/popupbanner/js/popupbanner.js?v=1.0.2');
        }
    }
}
