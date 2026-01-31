import React from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './style.less';

class LocationsPage extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            gameTitle: this.props.match?.url.includes('dishonored-2') ? 'Dishonored 2' : 'Dishonored',
            gameType: this.props.match?.url.includes('dishonored-2') ? 'dishonored-2' : 'dishonored',
            locations: [],
            isLoaded: false,
            selectedType: 'all'
        };
    }

    componentDidMount() {
        this.getLocations();
    }

    getLocations = () => {
        const game = this.state.gameTitle;
        axios.get(`http://localhost:3001/api/getLocationsData/game/${game}`)
            .then(res => {
                this.setState({
                    locations: res.data.data,
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

    getFilteredLocations = () => {
        const { locations, selectedType } = this.state;
        if (selectedType === 'all') return locations;
        return locations.filter(loc => loc.type === selectedType);
    }

    render() {
        const { gameTitle, gameType, isLoaded, selectedType } = this.state;
        const filteredLocations = this.getFilteredLocations();
        const basePath = gameType === 'dishonored-2' ? '/dishonored-2' : '/dishonored';

        if (!isLoaded) {
            return (
                <div className="loading-screen">
                    <div className="loading-text">Загрузка локаций...</div>
                </div>
            );
        }

        return (
            <div className="locations-page">
                <div className="page-background"></div>
                
                <div className="page-header">
                    <Link to={basePath} className="back-button">
                        <span className="back-icon">←</span>
                        <span>НАЗАД К ИГРЕ</span>
                    </Link>
                    <h1 className="page-title">ЛОКАЦИИ</h1>
                    <div className="game-badge">{gameTitle}</div>
                    <p className="page-subtitle">Места действия игры</p>
                </div>

                <div className="filter-bar">
                    <button 
                        className={`filter-btn ${selectedType === 'all' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('all')}
                    >
                        ВСЕ ЛОКАЦИИ
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'city' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('city')}
                    >
                        ГОРОДА
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'building' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('building')}
                    >
                        ЗДАНИЯ
                    </button>
                    <button 
                        className={`filter-btn ${selectedType === 'district' ? 'active' : ''}`}
                        onClick={() => this.handleFilterChange('district')}
                    >
                        РАЙОНЫ
                    </button>
                </div>

                <div className="locations-grid">
                    {filteredLocations.map((location, index) => (
                        <div 
                            key={index} 
                            className={`location-card ${location.type}`}
                            style={{
                                backgroundImage: location.image ? `url(${location.image})` : 'none',
                                backgroundSize: 'cover',
                                backgroundPosition: 'center center',
                                backgroundRepeat: 'no-repeat'
                            }}
                        >
                            <div className="location-overlay"></div>
                            <div className="location-content">
                                <div className="location-header">
                                    <div className="location-type-badge">{this.getTypeLabel(location.type)}</div>
                                    {location.district && <div className="location-district">{location.district}</div>}
                                </div>
                                
                                <div className="location-body">
                                    <h3 className="location-name">{location.name}</h3>
                                    {location.description && (
                                        <p className="location-description">{location.description}</p>
                                    )}
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                {filteredLocations.length === 0 && (
                    <div className="no-results">
                        <p>Локации не найдены</p>
                    </div>
                )}

                <div className="page-decorations">
                    <div className="corner-decoration top-left"></div>
                    <div className="corner-decoration top-right"></div>
                    <div className="corner-decoration bottom-left"></div>
                    <div className="corner-decoration bottom-right"></div>
                </div>
            </div>
        );
    }

    getTypeLabel(type) {
        const labels = {
            'city': 'Город',
            'building': 'Здание',
            'district': 'Район',
            'island': 'Остров',
            'ship': 'Корабль',
            'landmark': 'Достопримечательность'
        };
        return labels[type] || type;
    }
}

export default LocationsPage;
