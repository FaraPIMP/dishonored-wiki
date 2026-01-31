import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class PowersPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            gameTitle: this.props.match?.url.includes('dishonored-2') ? 'Dishonored 2' : 'Dishonored',
            gameType: this.props.match?.url.includes('dishonored-2') ? 'dishonored-2' : 'dishonored',
            powers: [],
            isLoaded: false,
            selectedType: 'all'
        };
    }

    componentDidMount() {
        this.getPowers();
    }

    getPowers = () => {
        axios.get('http://localhost:3001/api/getPowersData')
            .then(res => {
                const allPowers = res.data.data;
                const filteredPowers = allPowers.filter(power => 
                    power.game && power.game.toLowerCase() === this.state.gameTitle.toLowerCase()
                );
                
                this.setState({
                    powers: filteredPowers,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({ isLoaded: true });
            });
    }

    handleFilterChange = (type) => {
        this.setState({ selectedType: type });
    }

    getFilteredPowers = () => {
        const { powers, selectedType } = this.state;
        if (selectedType === 'all') return powers;
        return powers.filter(p => p.type === selectedType);
    }

    getTypeIcon = (type) => {
        return '';
    }
    translateType(type) {
        const translations = {
            'Movement': 'Перемещение',
            'Offensive': 'Атака',
            'Control': 'Контроль',
            'Perception': 'Восприятие',
            'Time': 'Время',
            'Stealth': 'Скрытность',
            'Summon': 'Призыв',
            'Passive': 'Пассивная'
        };
        return translations[type] || type;
    }
    render() {
        const { gameTitle, gameType, isLoaded, selectedType } = this.state;
        const filteredPowers = this.getFilteredPowers();
        const basePath = gameType === 'dishonored-2' ? '/dishonored-2' : '/dishonored';

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка способностей...</div>
                </div>
            );
        }
        
        return (
            <div className={`powers-page ${gameType}`}>
                <div className="page-background">
                    <div className="void-effect"></div>
                </div>
                
                <div className="page-header">
                    <Link to={basePath} className="back-button">
                        <span className="back-icon">←</span>
                        <span>НАЗАД К ИГРЕ</span>
                    </Link>
                    <h1 className="page-title">СПОСОБНОСТИ</h1>
                    <div className="game-badge">{gameTitle}</div>
                    <p className="page-subtitle">Дары Аутсайдера</p>
                </div>

                <div className="filter-bar">
                    <button 
                        className={`filter-btn ${selectedType === 'all' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('all')}
                    >
                        ВСЕ
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'Movement' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('Movement')}
                    >
                        ПЕРЕМЕЩЕНИЕ
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'Offensive' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('Offensive')}
                    >
                        АТАКА
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'Control' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('Control')}
                    >
                        КОНТРОЛЬ
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'Passive' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('Passive')}
                    >
                        ПАССИВНЫЕ
                    </button>
                </div>

                <div className="powers-grid">
                    {filteredPowers.map(power => (
                        <div key={power.id} className={`power-card type-${power.type?.toLowerCase()}`}>
                            <div className="power-icon-wrapper">
                                {power.image ? (
                                    <img src={power.image} alt={power.title} className="power-icon-image" />
                                ) : (
                                    <div className="power-icon-emoji">{this.getTypeIcon(power.type)}</div>
                                )}
                            </div>
                            
                            <div className="power-header">
                                <div className="power-type-badge">{this.translateType(power.type)}</div>
                            </div>
                            
                            <div className="power-glow"></div>
                            
                            <div className="power-content">
                                <h3 className="power-name">{power.title}</h3>
                                
                                {power.character_name && (
                                    <div className="power-character">
                                        {power.character_name}
                                    </div>
                                )}
                                
                                <p className="power-description">{power.description}</p>
                                
                                <div className="power-stats">
                                    {power.mana_cost && (
                                        <div className="stat-item">
                                            <span className="stat-label">Мана:</span>
                                            <span className="stat-value">{power.mana_cost}</span>
                                        </div>
                                    )}
                                    {power.rune_cost && (
                                        <div className="stat-item">
                                            <span className="stat-label">Руны:</span>
                                            <span className="stat-value">{power.rune_cost}</span>
                                        </div>
                                    )}
                                    {power.max_level && power.max_level > 1 && (
                                        <div className="stat-item">
                                            <span className="stat-label">Уровни:</span>
                                            <span className="stat-value">{power.max_level}</span>
                                        </div>
                                    )}
                                </div>

                                <div className="power-runes">
                                    {[...Array(power.rune_cost || 1)].map((_, i) => (
                                        <div key={i} className="rune active"></div>
                                    ))}
                                    {[...Array(Math.max(0, 4 - (power.rune_cost || 1)))].map((_, i) => (
                                        <div key={i + (power.rune_cost || 1)} className="rune"></div>
                                    ))}
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                {filteredPowers.length === 0 && (
                    <div className="no-results">
                        <p>Способности не найдены</p>
                    </div>
                )}

                <div className="outsider-mark">
                    <svg viewBox="0 0 100 100" className="mark-symbol">
                        <circle cx="50" cy="50" r="45" fill="none" stroke="currentColor" strokeWidth="1" opacity="0.3"/>
                        <path d="M 50 10 L 50 90 M 10 50 L 90 50" stroke="currentColor" strokeWidth="1" opacity="0.5"/>
                        <circle cx="50" cy="50" r="25" fill="none" stroke="currentColor" strokeWidth="2"/>
                        <circle cx="50" cy="50" r="5" fill="currentColor"/>
                    </svg>
                </div>
            </div>
        );
    }
}

export default PowersPage;
