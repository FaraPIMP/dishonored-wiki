import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class CharacterDetailPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            character: null,
            gameType: '',
            isLoaded: false
        };
    }

    componentDidMount() {
        this.loadCharacter();
    }

    componentDidUpdate(prevProps) {
        if (prevProps.match?.params?.id !== this.props.match?.params?.id) {
            this.loadCharacter();
        }
    }

    loadCharacter = () => {
        const path = this.props.location?.pathname || '';
        const characterId = parseInt(this.props.match?.params?.id);
        const gameType = path.includes('dishonored-2') ? 'dishonored2' : 'dishonored';
        
        axios.get('http://localhost:3001/api/getCharactersData')
            .then(res => {
                const allCharacters = res.data.data;
                const character = allCharacters.find(c => c.id === characterId);

                this.setState({
                    character,
                    gameType,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({ isLoaded: true });
            });
    }

    render() {
        const { character, isLoaded } = this.state;

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка...</div>
                </div>
            );
        }

        if (!character) {
            return (
                <div className="character-detail-page">
                    <div className="error-message">
                        <h2>Персонаж не найден</h2>
                        <Link to="/" className="back-link">Вернуться на главную</Link>
                    </div>
                </div>
            );
        }

        return (
            <div className="character-detail-page">
                <div className="page-background"></div>

                <Link to={`/${this.state.gameType === 'dishonored2' ? 'dishonored-2' : 'dishonored'}/characters`} className="back-button">
                    <span className="back-icon">←</span>
                    <span>К СПИСКУ ПЕРСОНАЖЕЙ</span>
                </Link>

                <div className="character-hero">
                    <div className="hero-image-wrapper">
                        <img src={character.image} alt={character.name} className="hero-image" />
                        <div className="hero-overlay"></div>
                    </div>
                    <div className="hero-content">
                        <div className="character-role">{character.role}</div>
                        <h1 className="character-name">{character.name}</h1>
                        <div className="character-divider"></div>
                    </div>
                </div>

                <div className="character-content">
                    <section className="bio-section">
                        <h2 className="section-title">БИОГРАФИЯ</h2>
                        <p className="bio-text">{character.description}</p>
                    </section>

                    {character.quotes && character.quotes.length > 0 && (
                        <section className="quotes-section">
                            <h2 className="section-title">ЦИТАТЫ</h2>
                            <div className="quotes-list">
                                {character.quotes.map((quote, index) => (
                                    <div key={index} className="quote-item">
                                        <div className="quote-mark">"</div>
                                        <p className="quote-text">{quote}</p>
                                    </div>
                                ))}
                            </div>
                        </section>
                    )}

                    {character.status && (
                        <section className="info-section">
                            <div className="info-grid">
                                <div className="info-item">
                                    <span className="info-label">Статус:</span>
                                    <span className="info-value">{character.status}</span>
                                </div>
                                {character.voice_actor && (
                                    <div className="info-item">
                                        <span className="info-label">Актёр озвучки:</span>
                                        <span className="info-value">{character.voice_actor}</span>
                                    </div>
                                )}
                                {character.first_appearance && (
                                    <div className="info-item">
                                        <span className="info-label">Первое появление:</span>
                                        <span className="info-value">{character.first_appearance}</span>
                                    </div>
                                )}
                                {character.faction && (
                                    <div className="info-item">
                                        <span className="info-label">Фракция:</span>
                                        <span className="info-value">{character.faction}</span>
                                    </div>
                                )}
                            </div>
                        </section>
                    )}

                    {character.powers && character.powers.length > 0 && (
                        <section className="powers-section">
                            <h2 className="section-title">СПОСОБНОСТИ</h2>
                            
                            {['Активные', 'Пассивные'].map(category => {
                                const categoryPowers = character.powers.filter(p => p.category === category);
                                if (categoryPowers.length === 0) return null;

                                return (
                                    <div key={category} className="powers-category">
                                        <h3 className="category-title">{category}</h3>
                                        
                                        <div className="powers-table">
                                            <div className="powers-table-header">
                                                <div className="col-ability">Способность</div>
                                                <div className="col-runes">Руны</div>
                                                <div className="col-mana">Расход маны</div>
                                                <div className="col-effect">Эффект</div>
                                            </div>

                                            {categoryPowers.map((power, powerIndex) => (
                                                <div key={powerIndex} className="power-group">
                                                    {power.levels.map((level, levelIndex) => (
                                                        <div key={levelIndex} className="power-row">
                                                            {levelIndex === 0 && (
                                                                <div className="col-ability" rowSpan={power.levels.length}>
                                                                    <div className="ability-name-wrapper">
                                                                        <span className="ability-name">{power.name}</span>
                                                                        {power.levels.length > 1 && (
                                                                            <span className="ability-level"> {level.level === 1 ? 'I' : 'II'}</span>
                                                                        )}
                                                                    </div>
                                                                </div>
                                                            )}
                                                            {levelIndex > 0 && (
                                                                <div className="col-ability continuation">
                                                                    <div className="ability-name-wrapper">
                                                                        <span className="ability-level-only">{power.name} {level.level === 1 ? 'I' : 'II'}</span>
                                                                    </div>
                                                                </div>
                                                            )}
                                                            <div className="col-runes">{level.runes}</div>
                                                            <div className="col-mana">{level.mana}</div>
                                                            <div className="col-effect">{level.effect}</div>
                                                        </div>
                                                    ))}
                                                </div>
                                            ))}
                                        </div>
                                    </div>
                                );
                            })}
                        </section>
                    )}
                </div>
            </div>
        );
    }
}

export default CharacterDetailPage;
