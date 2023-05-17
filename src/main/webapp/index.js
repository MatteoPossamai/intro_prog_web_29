let phrasesFilePath = './phrases.json';

/**
 * Get a phrase from the JSON file and change the content of the p element
 */
function getFounderPhrase() {
    let p_element = document.getElementById('phrase-content');

    let requestForPhrases = new XMLHttpRequest();
    requestForPhrases.open('GET', phrasesFilePath, true);

    requestForPhrases.onload = function() {
        // Get the phrases from the JSON file
        let phrasesReturned = JSON.parse(requestForPhrases.responseText)['phrases'];
        let random_index = Math.floor(Math.random() * phrasesReturned.length);

        // Change the content of the p element
        p_element.innerHTML = phrasesReturned[random_index];
    }

    // Send the request
    requestForPhrases.send();
}

// Load the content when the page loads
window.onload = getFounderPhrase;
// Change the content every 20 seconds
setInterval(getFounderPhrase, 20000);