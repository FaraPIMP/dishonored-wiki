import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class CharactersPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            gameTitle: this.props.match?.url.includes('dishonored-2') ? 'Dishonored 2' : 'Dishonored',
            gameType: this.props.match?.url.includes('dishonored-2') ? 'dishonored2' : 'dishonored',
            characters: [],
            isLoaded: false
        };
    }

    componentDidMount() {
        this.getCharacters();
    }

    getCharacters = () => {
        axios.get('http://localhost:3001/api/getCharactersData')
            .then(res => {
                const allCharacters = res.data.data;
                const filteredCharacters = allCharacters.filter(char => 
                    char.game && char.game.toLowerCase() === this.state.gameTitle.toLowerCase()
                );
                
                this.setState({
                    characters: filteredCharacters,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({ isLoaded: true });
            });
    }

    render() {
        const { gameTitle, gameType, characters, isLoaded } = this.state;
        const basePath = gameType === 'dishonored2' ? '/dishonored-2' : '/dishonored';
        
        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка персонажей...</div>
                </div>
            );
        }
        
        return (
            <div className="characters-page">
                <div className="page-background"></div>
                
                <div className="page-header">
                    <Link to={basePath} className="back-button">
                        <span className="back-icon">←</span>
                        <span>НАЗАД К ИГРЕ</span>
                    </Link>
                    <h1 className="page-title">ПЕРСОНАЖИ</h1>
                    <div className="game-badge">{gameTitle}</div>
                </div>

                <div className="characters-grid">
                    {characters.map((character) => (
                        <Link 
                            to={`${basePath}/characters/${character.id}`}
                            key={character.id} 
                            className="character-card"
                            style={{ backgroundImage: `url(${character.image})` }}
                        >
                            <div className="card-overlay"></div>
                            <div className="card-content">
                                <h3 className="character-name">{character.name}</h3>
                                <p className="character-role">{character.role}</p>
                                {character.faction && (
                                    <p className="character-faction">{character.faction}</p>
                                )}
                                {character.status && (
                                    <div className={`character-status status-${character.status.toLowerCase()}`}>
                                        {character.status}
                                    </div>
                                )}
                            </div>
                            <div className="details-button">ПОДРОБНЕЕ</div>
                        </Link>
                    ))}
                </div>

                {characters.length === 0 && (
                    <div className="no-characters">
                        <p>Персонажи не найдены</p>
                    </div>
                )}

                <div className="page-decoration top-left"></div>
                <div className="page-decoration top-right"></div>
                <div className="page-decoration bottom-left"></div>
                <div className="page-decoration bottom-right"></div>
            </div>
        );
    }
}

export default CharactersPage;
