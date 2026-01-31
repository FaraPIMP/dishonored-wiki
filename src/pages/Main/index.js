import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class MainPage extends React.Component {
    constructor() {
        super();

        this.state = {
            dishonored1: null,
            dishonored2: null,
            isLoaded: false,
            activeHover: null
        };

        this.hoverSound = new Audio('/assets/sounds/hover.mp3');
        this.hoverSound.volume = 0.3;
        this.hoverSound.preload = 'auto';

        this.bladeSound = new Audio('/assets/sounds/blade.mp3');
        this.bladeSound.volume = 0.5;
        this.bladeSound.preload = 'auto';

        this.magicSound = new Audio('/assets/sounds/magic.mp3');
        this.magicSound.volume = 0.5;
        this.magicSound.preload = 'auto';
    }

    componentDidMount() {
        this.getGamesData();
        this.initMouseTracking();
    }

    getGamesData = () => {
        axios.get('http://localhost:3001/api/getGamesData')
            .then(res => {
                const games = res.data.data;
                const d1 = games.find(g => g.title.includes('Dishonored') && !g.title.includes('2'));
                const d2 = games.find(g => g.title.includes('Dishonored 2'));
                
                this.setState({
                    dishonored1: d1,
                    dishonored2: d2,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({
                    dishonored1: { title: 'Dishonored', subtitle: 'Revenge Solves Everything' },
                    dishonored2: { title: 'Dishonored 2', subtitle: 'Take Back What\'s Yours' },
                    isLoaded: true
                });
            });
    }

    initMouseTracking = () => {
        document.addEventListener('mousemove', (e) => {
            const x = (e.clientX / window.innerWidth - 0.5) * 20;
            const y = (e.clientY / window.innerHeight - 0.5) * 20;
            
            document.documentElement.style.setProperty('--mouse-x', `${x}px`);
            document.documentElement.style.setProperty('--mouse-y', `${y}px`);
        });
    }

    handleHover = (side) => {
        this.setState({ activeHover: side });
        
        this.hoverSound.currentTime = 0;
        this.hoverSound.play().catch(() => {});
    }

    handleLeave = () => {
        this.setState({ activeHover: null });
    }

    playClickSound = () => {
        const sound = Math.random() > 0.5 ? this.bladeSound : this.magicSound;
        sound.currentTime = 0;
        sound.play().catch(() => {});
    }

    render() {
        const { dishonored1, dishonored2, isLoaded, activeHover } = this.state;

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Loading...</div>
                </div>
            );
        }

        return (
            <div className="main-container">
                <div className="background-overlay"></div>
                <div className="grain-overlay"></div>
                
                <Link
                    to="/dishonored"
                    className={`game-half left-half ${activeHover === 'left' ? 'active' : ''} ${activeHover === 'right' ? 'inactive' : ''}`}
                    onMouseEnter={() => this.handleHover('left')}
                    onMouseLeave={this.handleLeave}
                    onClick={this.playClickSound}
                >
                    <div className="game-content">
                        <h1 className="game-title">{dishonored1?.title || 'DISHONORED'}</h1>
                        <p className="game-subtitle">{dishonored1?.subtitle || 'Revenge Solves Everything'}</p>
                        <div className="game-year">2012</div>
                    </div>
                    
                    <div className="click-hint">Нажмите, чтобы войти</div>
                    
                    <div className="corner-decoration top-left"></div>
                    <div className="corner-decoration bottom-left"></div>
                </Link>

                <div className="divider-container">
                    <div className="divider-line"></div>
                    <div className="divider-logo">
                        <div className="logo-text">DISHONORED WIKI</div>
                    </div>
                    <div className="divider-glow"></div>
                </div>

                <Link
                    to="/dishonored-2"
                    className={`game-half right-half ${activeHover === 'right' ? 'active' : ''} ${activeHover === 'left' ? 'inactive' : ''}`}
                    onMouseEnter={() => this.handleHover('right')}
                    onMouseLeave={this.handleLeave}
                    onClick={this.playClickSound}
                >
                    <div className="game-content">
                        <h1 className="game-title">{dishonored2?.title || 'DISHONORED 2'}</h1>
                        <p className="game-subtitle">{dishonored2?.subtitle || 'Take Back What\'s Yours'}</p>
                        <div className="game-year">2016</div>
                    </div>
                    
                    <div className="click-hint">Нажмите, чтобы войти</div>
                    
                    <div className="corner-decoration top-right"></div>
                    <div className="corner-decoration bottom-right"></div>
                </Link>


            </div>
        );
    }
}

export default MainPage;
