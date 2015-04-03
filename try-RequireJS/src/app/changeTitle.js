define(['jquery'],function($){

    return function(title){
        title = title || '你好，世界';
        $('h2').text(title);
    }
});