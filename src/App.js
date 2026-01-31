import React from 'react';
import { withRouter } from 'react-router-dom';
import './style/main.less';

class App extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            isMusicPlaying: false
        };
        this.bgMusic = null;
    }

    componentDidMount() {
        this.initBackgroundMusic();
        
        if (this.props.location) {
             this.updatePageClass(this.props.location.pathname);
        }
        
        window.onpageshow = function (event) { 
            if (event.persisted) { 
                window.location.reload(); 
            } 
        };
    }
    
    componentDidUpdate(prevProps) {
        if (this.props.location && this.props.location.pathname !== prevProps.location?.pathname) {
            this.updatePageClass(this.props.location.pathname);
        }
    }

    updatePageClass = (pathname) => {
        if (!pathname) {
            pathname = '/';
        }
        
        const pathArray = pathname.split('/').filter(p => p !== '');
        let currentPath = 'main';

        if (pathArray.length > 0) {
            currentPath = pathArray[pathArray.length - 1];
        }

        const html = document.querySelector('html');
        if (html) {
            html.className = '';
            html.classList.add(currentPath + '_page');
        }
    }

    initBackgroundMusic = () => {
        if (!this.bgMusic) {
            this.bgMusic = new Audio('/assets/sounds/background.mp3');
            this.bgMusic.loop = true;
            this.bgMusic.volume = 0.2;
            this.setState({ isMusicPlaying: false });
        }
    }

    toggleMusic = () => {
        if (!this.bgMusic) {
            this.initBackgroundMusic();
        }

        if (this.state.isMusicPlaying) {
            this.bgMusic.pause();
            this.setState({ isMusicPlaying: false });
        } else {
            this.bgMusic.play().catch(e => console.error("Audio play failed", e));
            this.setState({ isMusicPlaying: true });
        }
    }

    render() {
        return (
            <React.Fragment>
                <main className="app-main">
                    {this.props.children}
                </main>

                <button 
                    className={`music-button ${this.state.isMusicPlaying ? 'playing' : ''}`}
                    onClick={this.toggleMusic}
                    title={this.state.isMusicPlaying ? 'Остановить музыку' : 'Включить музыку'}
                >
                    <img src="/assets/music-icon.png" alt="Music" />
                </button>
            </React.Fragment>
        );
    }
}

export default withRouter(App);

