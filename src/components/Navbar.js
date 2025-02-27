import React, { useState, useEffect } from 'react';
import { Button } from './Button';
import { Link } from 'react-router-dom';
import './Navbar.css';

function Navbar() {
  const [click, setClick] = useState(false);
  const [button, setButton] = useState(true);

  const handleClick = () => setClick(!click);
  const closeMobileMenu = () => setClick(false);

  const showButton = () => {
    if (window.innerWidth <= 960) {
      setButton(false);
    } else {
      setButton(true);
    }
  };

  useEffect(() => {
    showButton();
  }, []);

  window.addEventListener('resize', showButton);

  return (
    <>
      <nav className='navbar'>
        <div className='navbar-container'>
          <Link to='/' className='navbar-logo' onClick={closeMobileMenu}>
            Elias R
            <i className='fab fa-typo3' />
          </Link>
          <div className='menu-icon' onClick={handleClick}>
            <i className={click ? 'fas fa-times' : 'fas fa-bars'} />
          </div>
          <ul className={click ? 'nav-menu active' : 'nav-menu'}>
            {/* <li className='nav-item'>
              <Link to='/' className='nav-links' onClick={closeMobileMenu}>
                Home
              </Link>
            </li> */}
            <li className='nav-item'>
              <Link
                to='/games'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Games
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/design'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Design
              </Link>
            </li>
            <li className='nav-item'>
              <Link
                to='/programming'
                className='nav-links'
                onClick={closeMobileMenu}
              >
                Programming
              </Link>
            </li>

            <li>
              <Link
                to=''
                className='nav-links-mobile'
                onClick={closeMobileMenu}
              >
                HOME
              </Link>
            </li>
          </ul>
          {button && <Button buttonStyle='btn--outline'>HOME</Button>}
        </div>
      </nav>
    </>
  );
}

export default Navbar;
