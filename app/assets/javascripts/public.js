function toggle(param) {
    //
    void_element = document.querySelector('#void')
    if (void_element.offsetWidth > 1) {
        if (Math.max(document.documentElement.clientWidth, window.innerWidth || 0) > 414) {
            [param].forEach(toggleClassOnBody)
        }
    }
    // When the client size is greater than 414 pixels

}

function toggleClassOnBody(item) {
    body = document.querySelector('body');
    body.classList.toggle(item);

}