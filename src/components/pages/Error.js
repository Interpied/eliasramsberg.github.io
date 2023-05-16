import { Link } from 'react-router-dom';
import React from 'react';
import '../../App.css';

function Error (){
  return (
    <div className='errorPage'>
      <div className='errorPageInside'>
        <h2>404</h2>
        <p>page not found</p>
        <img src='images/penguin-walk.gif' alt="penguin" />
        <p>
          <Link className='homeButton' to='/'>back home</Link>
        </p>

      </div>
    </div>
  );
}

export default Error;