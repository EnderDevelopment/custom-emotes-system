let emotes = [];

window.addEventListener('message', (event) => {
    if (event.data.type === 'open') {
        emotes = event.data.emotes;
        document.body.style.display = 'block';
        renderEmotes(emotes);
    }
});

function renderEmotes(emotesToRender) {
    const emotesContainer = document.getElementById('emotes');
    emotesContainer.innerHTML = '';
    
    emotesToRender.forEach((emote, index) => {
        const emoteElement = document.createElement('div');
        emoteElement.className = 'emote';
        emoteElement.textContent = emote.name;
        emoteElement.addEventListener('click', () => {
            fetch(`https://${GetParentResourceName()}/playEmote`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify({ id: index })
            }).then(resp => resp.json()).then(resp => console.log(resp));
        });
        emotesContainer.appendChild(emoteElement);
    });
}

document.getElementById('search').addEventListener('input', (event) => {
    const searchTerm = event.target.value.toLowerCase();
    const filteredEmotes = emotes.filter(emote => emote.name.toLowerCase().includes(searchTerm));
    renderEmotes(filteredEmotes);
});

document.querySelectorAll('.category').forEach(button => {
    button.addEventListener('click', () => {
        const category = button.getAttribute('data-category');
        if (category === 'all') {
            renderEmotes(emotes);
        } else {
            const filteredEmotes = emotes.filter(emote => emote.category === category);
            renderEmotes(filteredEmotes);
        }
    });
});

document.getElementById('close').addEventListener('click', () => {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        document.body.style.display = 'none';
    });
});