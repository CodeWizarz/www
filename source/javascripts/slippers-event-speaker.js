(function () {
    const blocks = document.querySelectorAll('.slpEventSpeakers')

    if (blocks.length < 1) {
        console.warn('The Slippers speakers block JavaScript was loaded, but no element with classname slpEventSpeakers was found');
        return null;
    }

    for (let i=0; i<blocks.length; i++) {
        const speakerBlock = blocks[i];
        initializeRevealButton(speakerBlock);
    }

    function initializeRevealButton(block) {
        const revealButton = block.querySelector('.slpEventSpeakers__button');
        const speakers = block.querySelectorAll('figure');

        revealButton.addEventListener('click', function() {
            for (let i=0; i<speakers.length; i++) {
                speakers[i].style.display = 'block';
            }
            revealButton.remove();
        })
    }
})()