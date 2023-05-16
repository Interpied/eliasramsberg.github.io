import React from 'react';
import Navbar from './components/Navbar';
import './App.css';
import Home from './components/pages/Home';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';
import Services from './components/pages/Services';
import Products from './components/pages/Products';
// import SignUp from './components/pages/SignUp';
import Art from './components/pages/Art';
import Games from './components/pages/Games';
import SingleGame from './components/pages/SingleGame';
import Footer from './components/Footer';
import Error from './components/pages/Error';
import Misc from './components/pages/Misc';
import Design from './components/pages/Design';
import Photography from './components/pages/Photography';

function App() {
  return (
    <div className = 'insideBody'>
      <Router>
        <div className='allButFooter'>
          <Navbar />
          <Switch>
            <Route path='/' exact component={Home}>

            </Route>

            <Route path='/services' component={Services} />
            <Route path='/products' component={Products} />
            <Route path='/art' component={Art} />
            <Route path='/misc' component={Misc} />
            <Route path='/design' component={Design} />
            <Route path='/photography' component={Photography} />

            {/* <Route path='/games' element={<Games />} />
            <Route path='/games/:gameId'element={<SingleGame />} /> */}
            <Route exact path='/games' component={Games} />
            <Route path='/games/:gameId' component={SingleGame} />
            {/* <Route path='/games/*' component={Error} /> */}

            {/* <Route path='sign-up' component={SignUp} /> */}
            <Route path='*' component={Error} />
          </Switch>

        </div>
        <div className='onlyFooter'>
          <Footer />
        </div>

      </Router>
    </div>
  );
}

export default App;
