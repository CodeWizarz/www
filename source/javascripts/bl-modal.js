var blOpenModal = function(blOpenModalTrigger, blOpenModalTarget)
{
  var consoleLogsEnable = new Boolean(false);

  var openTriggers = document.querySelectorAll(blOpenModalTrigger);
  var targetModal = document.querySelector(blOpenModalTarget);
  var modalBackgroundClassname = 'bl-modal-background';
  var modalBackgroundSelector = blOpenModalTarget + ' + .' + modalBackgroundClassname;
  var modalBackground = '<div class="' + modalBackgroundClassname + '"></div>';

  targetModal.insertAdjacentHTML('afterend', modalBackground);
  // Beware order of operations. Can't queryselector the below until the relevant element is inserted by the above.
  var targetModalBackground = document.querySelector(modalBackgroundSelector);

  for(loopcount=0;loopcount<openTriggers.length;loopcount++)
  {

    if(consoleLogsEnable == true)
    {
      console.log('listening for open click on: ' + blOpenModalTrigger);
    };
    openTriggers[loopcount].addEventListener('click', function(e)
    {
      if(consoleLogsEnable == true)
      {
        console.log('opening modal: ' + blOpenModalTarget);
      };
      if(e.target.tagName !== 'A')
      {
        targetModalBackground.classList.add('bl-visible');
        targetModal.classList.add('bl-visible');
      };
    });

  };

  var blCloseModal = function()
  {
    if(consoleLogsEnable == true)
    {
      console.log('closing modal: ' + blOpenModalTarget);
    };
    targetModalBackground.classList.remove('bl-visible');
    targetModal.classList.remove('bl-visible');
  };

  targetModal.querySelector('.bl-modal-close').addEventListener('click', function()
  {
    blCloseModal();
  });

  targetModalBackground.addEventListener('click', function()
  {
    blCloseModal();
  });

};


window.blOpenModal = blOpenModal;