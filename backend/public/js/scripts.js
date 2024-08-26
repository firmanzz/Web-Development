document.addEventListener('DOMContentLoaded', function () {
    const actorsList = ['Jason Statham', 'Johnny Depp', 'Gal Gadot', 'Lukman Sardi', 'Yayan Ruhiyan', 'Chris Hemsworth', 'Robert Downey Jr.', 'Scarlett Johansson', 'Mark Ruffalo'];
    const searchActorInput = document.getElementById('searchActor');
    const autocompleteSuggestions = document.getElementById('autocompleteSuggestions');
    const actorsContainer = document.getElementById('actorsContainer');

    searchActorInput.addEventListener('input', function () {
        const query = this.value.toLowerCase();
        autocompleteSuggestions.innerHTML = '';

        if (query.length > 0) {
            const filteredActors = actorsList.filter(actor => actor.toLowerCase().includes(query));

            filteredActors.forEach(actor => {
                const suggestionItem = document.createElement('div');
                suggestionItem.className = 'autocomplete-suggestion';
                suggestionItem.textContent = actor;
                suggestionItem.addEventListener('click', function () {
                    addActor(actor);
                    autocompleteSuggestions.innerHTML = '';
                    searchActorInput.value = '';
                });
                autocompleteSuggestions.appendChild(suggestionItem);
            });
        }
    });

    function addActor(actorName) {
        const actorBox = document.createElement('div');
        actorBox.className = 'actor-box';

        const actorNameSpan = document.createElement('span');
        actorNameSpan.textContent = actorName;

        const removeButton = document.createElement('button');
        removeButton.type = 'button';
        removeButton.className = 'btn-close';
        removeButton.addEventListener('click', function () {
            actorsContainer.removeChild(actorBox);
        });

        actorBox.appendChild(actorNameSpan);
        actorBox.appendChild(removeButton);
        actorsContainer.appendChild(actorBox);
    }
});

function deleteMovie(movieId) {
  if (confirm("Are you sure you want to delete this movie?")) {
    fetch(`/api/movies/deleteMovie/${movieId}`, {
      method: "DELETE",
    })
      .then((response) => {
        if (response.ok) {
          document.getElementById(`movie-${movieId}`).remove();
          alert("Movie deleted");
        } else {
          alert("Failed to delete the movie");
        }
      })
      .catch((error) => console.error("Error:", error));
  }
}

function toggleSidebar() {
  const sidebar = document.querySelector(".sidebar");
  sidebar.classList.toggle("open");
}

function toggleSubmenu() {
  const submenuIcon = document.querySelector(".submenu-icon");
  const submenu = document.querySelector(".submenu");
  submenuIcon.classList.toggle("rotate-180");
  submenu.classList.toggle("open");
}

function toggleDescription(movieId) {
    const description = document.getElementById(`description-${movieId}`);
    const button = document.querySelector(`#movie-${movieId} .read-more`);

    if (description.classList.contains('expanded')) {
        description.classList.remove('expanded');
        button.textContent = 'Read more';
    } else {
        description.classList.add('expanded');
        button.textContent = 'Read less';
    }
}

function searchMovies() {
    let searchTerm = document.getElementById('searchBar').value.toLowerCase();
    let movies = document.querySelectorAll('tbody tr');

    movies.forEach(function(movie) {
        let title = movie.querySelector('td:nth-child(2)').innerText.toLowerCase();
        if (title.includes(searchTerm)) {
            movie.style.display = '';
        } else {
            movie.style.display = 'none';
        }
    });
}

document.getElementById('filterStatus').addEventListener('change', function() {
    let selectedStatus = this.value;
    let movies = document.querySelectorAll('tbody tr');

    movies.forEach(function(movie) {
        let status = movie.querySelector('td:nth-child(6)').innerText.trim();
        
        if (status === selectedStatus || selectedStatus === 'All') {
            movie.style.display = '';
        } else {
            movie.style.display = 'none';
        }
    });
});

document.getElementById('showCount').addEventListener('change', function() {
    let showCount = parseInt(this.value);
    let movies = document.querySelectorAll('tbody tr');

    movies.forEach(function(movie, index) {
        if (index < showCount) {
            movie.style.display = '';
        } else {
            movie.style.display = 'none';
        }
    });
});
