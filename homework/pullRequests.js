document.getElementById('Open_button').addEventListener('click', () => {
    event.target.style.fontWeight = 'bold';
    document.getElementById('open_pr').style.display = 'flex';
    document.getElementById('close_pr').style.display = 'none';
    document.getElementById('Closed_button').style.fontWeight = 'normal';
})
document.getElementById('Closed_button').addEventListener('click', () => {
    event.target.style.fontWeight = 'bold';
    document.getElementById('open_pr').style.display = 'none';
    document.getElementById('close_pr').style.display = 'flex';
    document.getElementById('Open_button').style.fontWeight = 'normal';
})