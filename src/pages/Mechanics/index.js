import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class MechanicsPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            gameTitle: this.props.match?.url.includes('dishonored-2') ? 'Dishonored 2' : 'Dishonored',
            gameType: this.props.match?.url.includes('dishonored-2') ? 'dishonored-2' : 'dishonored',
            mechanics: [],
            isLoaded: false,
            selectedCategory: 'all'
        };
    }

    componentDidMount() {
        this.getMechanics();
    }

    getMechanics = () => {
        const game = this.state.gameTitle;
        axios.get(`http://localhost:3001/api/getMechanicsData/game/${game}`)
            .then(res => {
                this.setState({
                    mechanics: res.data.data,
                    isLoaded: true
                });
            })
            .catch(err => {
                console.log(err);
                this.setState({ isLoaded: true });
            });
    }

    handleCategoryChange = (category) => {
        this.setState({ selectedCategory: category });
    }

    getFilteredMechanics = () => {
        const { mechanics, selectedCategory } = this.state;
        if (selectedCategory === 'all') return mechanics;
        return mechanics.filter(m => m.category === selectedCategory);
    }

    getCategoryIcon = (category) => {
        return '';
    }

    getCategoryLabel = (category) => {
        const labels = {
            'chaos': 'Система Хаоса',
            'stealth': 'Стелс',
            'achievements': 'Достижения',
            'customization': 'Кастомизация',
            'progression': 'Прогрессия',
            'combat': 'Боевая система'
        };
        return labels[category] || category;
    }

    render() {
        const { gameTitle, gameType, isLoaded, selectedCategory } = this.state;
        const filteredMechanics = this.getFilteredMechanics();
        const basePath = gameType === 'dishonored-2' ? '/dishonored-2' : '/dishonored';

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка механик...</div>
                </div>
            );
        }

        return (
            <div className="mechanics-page">
                <div className="page-background">
                    <div className="chaos-effect"></div>
                </div>
                
                <div className="page-header">
                    <Link to={basePath} className="back-button">
                        <span className="back-icon">←</span>
                        <span>НАЗАД К ИГРЕ</span>
                    </Link>
                    <h1 className="page-title">МЕХАНИКИ ИГРЫ</h1>
                    <div className="game-badge">{gameTitle}</div>
                    <p className="page-subtitle">Геймплейные системы и достижения</p>
                </div>

                <div className="category-filter">
                    <button 
                        className={`filter-btn ${selectedCategory === 'all' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('all')}
                    >
                        ВСЕ МЕХАНИКИ
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'chaos' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('chaos')}
                    >
                        ХАОС
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'stealth' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('stealth')}
                    >
                        СТЕЛС
                    </button>
                    <button 
                        className={`filter-btn ${selectedCategory === 'achievements' ? 'active' : ''}`}
                        onClick={() => this.handleCategoryChange('achievements')}
                    >
                        ДОСТИЖЕНИЯ
                    </button>
                </div>

                <div className="mechanics-grid">
                    {filteredMechanics.map((mechanic, index) => (
                        <div key={index} className={`mechanic-card category-${mechanic.category}`}>
                            {mechanic.image && (
                                <div className="mechanic-image-wrapper">
                                    <img src={mechanic.image} alt={mechanic.title} className="mechanic-bg-image" />
                                </div>
                            )}
                            
                            <div className="mechanic-header">
                                <div className="mechanic-icon">{this.getCategoryIcon(mechanic.category)}</div>
                                <div className="mechanic-category">{this.getCategoryLabel(mechanic.category)}</div>
                            </div>

                            <h3 className="mechanic-title">{mechanic.title}</h3>
                            <p className="mechanic-description">{mechanic.description}</p>

                            {mechanic.effects && mechanic.effects.length > 0 && (
                                <div className="mechanic-section">
                                    <h4 className="section-title">Эффекты:</h4>
                                    <ul className="effect-list">
                                        {mechanic.effects.map((effect, idx) => (
                                            <li key={idx}>{effect}</li>
                                        ))}
                                    </ul>
                                </div>
                            )}

                            {mechanic.tips && mechanic.tips.length > 0 && (
                                <div className="mechanic-section tips-section">
                                    <h4 className="section-title">Советы:</h4>
                                    <ul className="tips-list">
                                        {mechanic.tips.map((tip, idx) => (
                                            <li key={idx}>{tip}</li>
                                        ))}
                                    </ul>
                                </div>
                            )}
                        </div>
                    ))}
                </div>

                {filteredMechanics.length === 0 && (
                    <div className="no-results">
                        <p>Механики не найдены</p>
                    </div>
                )}

                <div className="outsider-quote">
                    <div className="quote-mark">"</div>
                    <p className="quote-text">
                        Каждый выбор имеет последствия. <br/>
                        Станешь ли ты призраком или палачом?
                    </p>
                    <div className="quote-author">— Аутсайдер</div>
                </div>
            </div>
        );
    }
}

export default MechanicsPage;
