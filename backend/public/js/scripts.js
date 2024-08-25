function deleteMovie(movieId) {
    if (confirm("Are you sure you want to delete this movie?")) {
        fetch(`/api/movies/deleteMovie/${movieId}`, {
            method: 'DELETE',
        })
        .then(response => {
            if (response.ok) {
                document.getElementById(`movie-${movieId}`).remove();
                alert('Movie deleted');
            } else {
                alert('Failed to delete the movie');
            }
        })
        .catch(error => console.error('Error:', error));
    }
}

function toggleSidebar() {
    const sidebar = document.querySelector('.sidebar');
    sidebar.classList.toggle('open');
}

function toggleSubmenu() {
    const submenuIcon = document.querySelector('.submenu-icon');
    const submenu = document.querySelector('.submenu');
    submenuIcon.classList.toggle('rotate-180');
    submenu.classList.toggle('open');
}
