// Load navbar into all pages
document.addEventListener('DOMContentLoaded', function() {
    // Create XMLHttpRequest for better compatibility with local files
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'navbar.html', true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            if (xhr.status === 200 || xhr.status === 0) { // status 0 for local files
                const body = document.body;
                const tempDiv = document.createElement('div');
                tempDiv.innerHTML = xhr.responseText;
                const navbar = tempDiv.firstChild;
                if (navbar && body.firstChild) {
                    body.insertBefore(navbar, body.firstChild);
                }
            } else {
                console.error('Error loading navbar:', xhr.status);
            }
        }
    };
    xhr.send();
});
