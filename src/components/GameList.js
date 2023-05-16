import React from 'react';
import './GameList.css';
import GameListItem from './GameListItem';

function GameList() {
  return (
    <div className='gameList'>
      {/* <h1 id="projectList">Categories</h1> */}
      <div className='gameList_container'>
        <GameListItem
          text='Western Duel Mayhem'
          img1='images/games/western-duel-mayhem.png'
          img2='images/wip.png'
          img3='images/wip.png'
          path='/games/western-duel-mayhem'
          id='western-duel-mayhem'
          bgcolor='#efd5de'
        />
        <GameListItem
          text='Squaresque'
          img1='images/games/squaresque.png'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Use two shapes as reference to estimate the volume of the third shape on screen. Play 5 rounds to get a final score for your performance.'
          path='/games/squaresque'
          id='squaresque'
          bgcolor='#d4eae6'
        />
        <GameListItem
          text='Keyboard Tangent'
          img1='images/games/keyboardtangent.png'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/keyboard-tangent'
          id='keyboard-tangent'
          bgcolor='#efead5'
        />
        <GameListItem
          text='Minesweeper'
          img1='images/games/minesweeper-cover.png'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/minesweeper'
          id='minesweeper'
          bgcolor='#e7a7a7'
        />
        <GameListItem
          text='Designperspektiv'
          img1='images/games/designperspektiv.jpg'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/designperspektiv'
          id='designperspektiv'
          bgcolor='#d5efe3'
        />
        <GameListItem
          text='Find the Anomaly'
          img1='images/games/find-the-anomaly.png'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/find-the-anomaly'
          id='find-the-anomaly'
          bgcolor='#efe1d5'
        />
        <GameListItem
          text='Casino Craze'
          img1='images/games/casino-craze.jpg'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/casino-craze'
          id='casino-craze'
          bgcolor='#d5efdb'
        />
        <GameListItem
          text='Alien Operation'
          img1='images/games/alien-operation.jpg'
          img2='images/wip.png'
          img3='images/wip.png'
          desc='Try to beat the time! Never seen before! Something Something! Wow so cool how is that possible! Nice one! Great Job!'
          path='/games/alien-operation'
          id='alien-operation'
          bgcolor='#e7efd5'
        />
        
      </div>
    </div>
  );
}

export default GameList;
