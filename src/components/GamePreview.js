import React from 'react';
import './GamePreview.css';
import GamePreviewItem from './GamePreviewItem';

function GamePreview() {
  return (
    <div className='gamePreview'>
      {/* <h1 id="projectList">Categories</h1> */}
      <div className='gamePreview__container'>

        <div className='gamePreview__wrapper'>
        <h1 id='title' >Quick Navigation</h1>
          <ul className='gamePreview__items'>
            <GamePreviewItem
              src='images/games/western-duel-mayhem.png'
              path='/games#western-duel-mayhem'
            />
            <GamePreviewItem
              src='images/games/squaresque.png'
              path='/games#squaresque'
            />
            <GamePreviewItem
              src='images/games/keyboardtangent.png'
              path='/games#keyboard-tangent'
            />
            <GamePreviewItem
              src='images/games/minesweeper-cover.png'
              path='/games#minesweeper'
            />
            <GamePreviewItem
              src='images/games/designperspektiv.jpg'
              path='/games#designperspektiv'
            />
          </ul>

          <ul className='gamePreview__items'>
            <GamePreviewItem
              src='images/games/find-the-anomaly.png'
              path='/games#find-the-anomaly'
            />
            <GamePreviewItem
              src='images/games/casino-craze.jpg'
              path='/games#casino-craze'
            />
            <GamePreviewItem
              src='images/games/alien-operation.jpg'
              path='/games#alien-operation'
            />
            <GamePreviewItem

            />
            <GamePreviewItem

            />
          </ul>

          <ul className='gamePreview__items'>
            <GamePreviewItem

            />
            <GamePreviewItem

            />
            <GamePreviewItem

            />
            <GamePreviewItem

            />
            <GamePreviewItem

            />
          </ul>
        </div>
      </div>
    </div>
  );
}

export default GamePreview;
