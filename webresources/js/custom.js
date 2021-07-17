/* eigene Icons in die Libary einfügen */
UIkit.icon.add('icon-wetter', '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17px" height="17px" viewBox="0 0 17 17" xml:space="preserve"><path d="M13.57,5.12h0a1.83,1.83,0,0,0,0-.47,2.31,2.31,0,0,0-2.29-2.34,2.36,2.36,0,0,0-1.82.85A3.25,3.25,0,0,0,3.31,4.65a3.18,3.18,0,0,0,.06.62,2.79,2.79,0,0,0,.87,5.45h9.33a2.8,2.8,0,0,0,0-5.6ZM4,12.3C3.63,13.59,2.84,14,2.84,14.86a1.43,1.43,0,0,0,1.4,1.46h0a1.43,1.43,0,0,0,1.4-1.46h0c0-.92-.79-1.26-1.16-2.56a.24.24,0,0,0-.29-.17h0A.23.23,0,0,0,4,12.3Zm4.66,0C8.3,13.59,7.51,14,7.51,14.86a1.4,1.4,0,0,0,2.78.33,1.28,1.28,0,0,0,0-.19v-.13c0-.92-.8-1.26-1.17-2.56a.24.24,0,0,0-.28-.17h0a.22.22,0,0,0-.16.16Zm4.67,0C13,13.59,12.17,14,12.17,14.86A1.4,1.4,0,1,0,15,15v-.12c0-.92-.79-1.26-1.16-2.56a.25.25,0,0,0-.3-.17h0A.26.26,0,0,0,13.34,12.3Z"/></svg>');
UIkit.icon.add('icon-temperatur', '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17px" height="17px" viewBox="0 0 17 17" xml:space="preserve"><path d="M12.22,4.63a3.32,3.32,0,0,0-6.63,0V9.56a4.26,4.26,0,1,0,6.63,0Zm-3.31,10a2.36,2.36,0,0,1-2.37-2.36,2.33,2.33,0,0,1,.94-1.9V4.63a1.43,1.43,0,0,1,2.85,0v5.69a2.37,2.37,0,0,1-1.42,4.26Zm.47-3.71v-.57A.47.47,0,0,0,9,9.8a.49.49,0,0,0-.52.43v.64a1.42,1.42,0,1,0,1.82.87,1.47,1.47,0,0,0-.87-.87Z"/></svg>');
UIkit.icon.add('icon-mail', '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17px" height="17px" viewBox="0 0 17 17" xml:space="preserve"><path d="M15,3.63H2.81A1.4,1.4,0,0,0,1.41,5v8.44a1.41,1.41,0,0,0,1.4,1.41H15a1.42,1.42,0,0,0,1.41-1.41V5A1.41,1.41,0,0,0,15,3.63Zm0,.93a.58.58,0,0,1,.18,0L8.91,10,2.63,4.6a.58.58,0,0,1,.18,0Zm0,9.38H2.81a.47.47,0,0,1-.47-.47V5.59L8.6,11a.47.47,0,0,0,.31.12.46.46,0,0,0,.3-.12l6.26-5.42v7.88A.47.47,0,0,1,15,13.94Z"/></svg>');
UIkit.icon.add('icon-close', '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="17px" height="17px" viewBox="0 0 17 17" xml:space="preserve"><path d="M17.24,2.91,14.91.57l-6,6-6-6L.57,2.91l6,6-6,6,2.34,2.33,6-6,6,6,2.33-2.33-6-6Z"/></svg>');



document.addEventListener('DOMContentLoaded', function() {
    // JavaScript zum verschleiern der E-Mail Adresse
    Array.prototype.slice.call(document.querySelectorAll('a span[id^="cloak"]')).forEach(function(span) {
        span.innerText = span.textContent;
    });
});