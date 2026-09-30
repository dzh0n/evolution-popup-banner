<?php
return array(
    'caption' => 'Всплывающий баннер',
    'introtext' => '',
    'settings' => array(
        'popup_banner_enabled' => array('caption'=>'Включить баннер','type'=>'dropdown','elements'=>'Нет==0||Да==1','default_text'=>'0'),
        'popup_banner_image' => array('caption'=>'Изображение баннера','type'=>'image','note'=>''),
        'popup_banner_link' => array('caption'=>'Ссылка при клике','type'=>'text','note'=>'Необязательно. Можно указать относительный или абсолютный URL.'),
        'popup_banner_new_tab' => array('caption'=>'Открывать ссылку в новой вкладке','type'=>'dropdown','elements'=>'Нет==0||Да==1','default_text'=>'0'),
        'popup_banner_delay' => array('caption'=>'Показать через, секунд','type'=>'text','default_text'=>'3','note'=>'0 — показать сразу после загрузки страницы.'),
        'popup_banner_mode' => array('caption'=>'Режим показа','type'=>'dropdown','elements'=>'На каждой странице==every_page||Только один раз==once||Повторять после закрытия==repeat','default_text'=>'repeat'),
        'popup_banner_repeat_value' => array('caption'=>'Повторно показать через','type'=>'text','default_text'=>'1','note'=>'Используется только для режима «Повторять после закрытия».'),
        'popup_banner_repeat_unit' => array('caption'=>'Единица времени повтора','type'=>'dropdown','elements'=>'Минут==minutes||Часов==hours||Дней==days','default_text'=>'days'),
        'popup_banner_version' => array('caption'=>'Версия баннера','type'=>'text','default_text'=>'1','note'=>'Увеличьте значение после замены акции/баннера — пользователи снова увидят новый баннер.'),
        'popup_banner_close_overlay' => array('caption'=>'Закрывать по клику на затемнение','type'=>'dropdown','elements'=>'Нет==0||Да==1','default_text'=>'1')
    )
);
