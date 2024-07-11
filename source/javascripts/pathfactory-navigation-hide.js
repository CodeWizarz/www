var windowURL = window.location.search;
if (windowURL.indexOf('menu=hide') > -1 && window.self != window.top) {
    document.querySelector('#global-nav ').style.display = 'none';
    document.querySelector('.footer.footer').style.display = 'none';
}
