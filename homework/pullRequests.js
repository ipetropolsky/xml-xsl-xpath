const openPr = document.getElementById('open_pr');
const closePr = document.getElementById('close_pr');
const openPrButton = document.getElementById('Open_button');
const closePrButton = document.getElementById('Closed_button');

openPrButton.addEventListener('click', () => {
    event.target.style.fontWeight = 'bold';
    openPr.style.display = 'flex';
    closePr.style.display = 'none';
    closePrButton.style.fontWeight = 'normal';
})
closePrButton.addEventListener('click', () => {
    event.target.style.fontWeight = 'bold';
    openPr.style.display = 'none';
    closePr.style.display = 'flex';
    openPrButton.style.fontWeight = 'normal';
})