import React, { useState, useEffect, useCallback } from 'react';
import axios from 'axios';

const API_BASE = process.env.REACT_APP_API_URL || 'http://localhost:3001/api';

function App() {
  const [user, setUser] = useState(null);
  const [platforms, setPlatforms] = useState({});
  const [gatescore, setGatescore] = useState({ overall: 0, breakdown: {} });
  const [loading, setLoading] = useState(false);
  const [token, setToken] = useState(localStorage.getItem('token'));

  // Login form state
  const [loginForm, setLoginForm] = useState({ email: '', password: '' });
  const [registerForm, setRegisterForm] = useState({ username: '', email: '', password: '' });
  const [showRegister, setShowRegister] = useState(false);

  const fetchUserProfile = useCallback(async () => {
    try {
      const response = await axios.get(`${API_BASE}/auth/profile`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setUser(response.data);
    } catch (error) {
      console.error('Failed to fetch profile:', error);
      if (error.response?.status === 401) {
        logout();
      }
    }
  }, [token]);

  const fetchPlatformStatus = useCallback(async () => {
    try {
      const response = await axios.get(`${API_BASE}/auth/platforms/status`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setPlatforms(response.data.platforms);
      setGatescore(response.data.gatescore || { overall: 0, breakdown: {} });
    } catch (error) {
      console.error('Failed to fetch platform status:', error);
    }
  }, [token]);

  const logout = useCallback(() => {
    setToken(null);
    setUser(null);
    setPlatforms({});
    setGatescore({ overall: 0, breakdown: {} });
    localStorage.removeItem('token');
  }, []);

  useEffect(() => {
    if (token) {
      fetchUserProfile();
      fetchPlatformStatus();
    }
    
    // Handle OAuth redirect
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('platform') && urlParams.get('status') === 'connected') {
      fetchPlatformStatus();
      // Clean URL
      window.history.replaceState({}, document.title, '/');
    }
  }, [token, fetchUserProfile, fetchPlatformStatus]);

  const login = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      const response = await axios.post(`${API_BASE}/auth/login`, loginForm);
      const { token: newToken, user: userData } = response.data;
      setToken(newToken);
      localStorage.setItem('token', newToken);
      setUser(userData);
      setLoginForm({ email: '', password: '' });
    } catch (error) {
      alert('Login failed: ' + (error.response?.data?.message || 'Unknown error'));
    } finally {
      setLoading(false);
    }
  };

  const register = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      await axios.post(`${API_BASE}/auth/register`, registerForm);
      alert('Registration successful! Please log in.');
      setShowRegister(false);
      setRegisterForm({ username: '', email: '', password: '' });
    } catch (error) {
      alert('Registration failed: ' + (error.response?.data?.message || 'Unknown error'));
    } finally {
      setLoading(false);
    }
  };

  const connectPlatform = (platform) => {
    const redirectUrl = `${API_BASE}/auth/${platform}`;
    window.location.href = redirectUrl;
  };

  const disconnectPlatform = async (platform) => {
    try {
      await axios.post(`${API_BASE}/auth/disconnect/${platform}`, {}, {
        headers: { Authorization: `Bearer ${token}` }
      });
      fetchPlatformStatus();
    } catch (error) {
      alert('Failed to disconnect platform: ' + (error.response?.data?.message || 'Unknown error'));
    }
  };

  const recalculateGatescore = async () => {
    setLoading(true);
    try {
      const response = await axios.post(`${API_BASE}/auth/gatescore/recalculate`, {}, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setGatescore(response.data.gatescore);
    } catch (error) {
      alert('Failed to recalculate Gatescore: ' + (error.response?.data?.message || 'Unknown error'));
    } finally {
      setLoading(false);
    }
  };

  const platformInfo = {
    discord: { name: 'Discord', color: 'bg-indigo-500', weight: '15%' },
    steam: { name: 'Steam', color: 'bg-blue-500', weight: '25%' },
    epic: { name: 'Epic Games', color: 'bg-gray-800', weight: '15%' },
    riot: { name: 'Riot Games', color: 'bg-red-500', weight: '25%' },
    twitch: { name: 'Twitch', color: 'bg-purple-500', weight: '20%' }
  };

  if (!token || !user) {
    return (
      <div className="min-h-screen bg-gray-900 flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div className="max-w-md w-full space-y-8">
          <div>
            <h1 className="text-center text-3xl font-extrabold text-white">Hearthgate</h1>
            <h2 className="text-center text-xl text-gray-300">Universal Guild Hub</h2>
            <p className="text-center text-sm text-gray-400 mt-2">
              Your gateway to better guild management across games
            </p>
          </div>
          
          <form className="mt-8 space-y-6" onSubmit={showRegister ? register : login}>
            <div className="rounded-md shadow-sm space-y-4">
              {showRegister && (
                <input
                  type="text"
                  required
                  placeholder="Username"
                  value={registerForm.username}
                  onChange={(e) => setRegisterForm({ ...registerForm, username: e.target.value })}
                  className="appearance-none rounded-lg relative block w-full px-3 py-2 border border-gray-600 placeholder-gray-400 text-white bg-gray-800 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                />
              )}
              <input
                type="email"
                required
                placeholder="Email address"
                value={showRegister ? registerForm.email : loginForm.email}
                onChange={(e) => {
                  const value = e.target.value;
                  if (showRegister) {
                    setRegisterForm({ ...registerForm, email: value });
                  } else {
                    setLoginForm({ ...loginForm, email: value });
                  }
                }}
                className="appearance-none rounded-lg relative block w-full px-3 py-2 border border-gray-600 placeholder-gray-400 text-white bg-gray-800 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
              />
              <input
                type="password"
                required
                placeholder="Password"
                value={showRegister ? registerForm.password : loginForm.password}
                onChange={(e) => {
                  const value = e.target.value;
                  if (showRegister) {
                    setRegisterForm({ ...registerForm, password: value });
                  } else {
                    setLoginForm({ ...loginForm, password: value });
                  }
                }}
                className="appearance-none rounded-lg relative block w-full px-3 py-2 border border-gray-600 placeholder-gray-400 text-white bg-gray-800 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
              />
            </div>

            <div>
              <button
                type="submit"
                disabled={loading}
                className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
              >
                {loading ? 'Loading...' : (showRegister ? 'Register' : 'Sign In')}
              </button>
            </div>

            <div className="text-center">
              <button
                type="button"
                onClick={() => setShowRegister(!showRegister)}
                className="text-indigo-400 hover:text-indigo-300 text-sm"
              >
                {showRegister ? 'Already have an account? Sign in' : 'Need an account? Register'}
              </button>
            </div>
          </form>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-900 text-white">
      {/* Header */}
      <header className="bg-gray-800 shadow">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center py-6">
            <div>
              <h1 className="text-3xl font-bold">Hearthgate</h1>
              <p className="text-gray-300">Welcome, {user.username}</p>
            </div>
            <button
              onClick={logout}
              className="bg-red-600 hover:bg-red-700 px-4 py-2 rounded-md text-sm font-medium"
            >
              Logout
            </button>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
        {/* Gatescore Section */}
        <div className="bg-gray-800 rounded-lg p-6 mb-8">
          <div className="flex justify-between items-center mb-4">
            <h2 className="text-2xl font-bold">Your Gatescore</h2>
            <button
              onClick={recalculateGatescore}
              disabled={loading}
              className="bg-indigo-600 hover:bg-indigo-700 px-4 py-2 rounded-md text-sm font-medium disabled:opacity-50"
            >
              Recalculate
            </button>
          </div>
          
          <div className="text-center mb-6">
            <div className="text-6xl font-bold text-indigo-400 mb-2">
              {gatescore.overall || 0}
            </div>
            <p className="text-gray-400">Overall Gatescore</p>
          </div>

          {/* Platform Breakdown */}
          <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
            {Object.entries(platformInfo).map(([platform, info]) => (
              <div key={platform} className="text-center">
                <div className={`${info.color} rounded-lg p-4 mb-2`}>
                  <div className="text-2xl font-bold">
                    {gatescore.breakdown?.[platform] || 0}
                  </div>
                  <div className="text-sm opacity-75">{info.weight}</div>
                </div>
                <p className="text-sm text-gray-300">{info.name}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Platform Connections */}
        <div className="bg-gray-800 rounded-lg p-6">
          <h2 className="text-2xl font-bold mb-6">Gaming Platform Connections</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {Object.entries(platformInfo).map(([platform, info]) => {
              const isConnected = platforms[platform]?.connected;
              return (
                <div key={platform} className="border border-gray-600 rounded-lg p-4">
                  <div className="flex items-center justify-between mb-4">
                    <h3 className="text-lg font-medium">{info.name}</h3>
                    <div className={`w-3 h-3 rounded-full ${isConnected ? 'bg-green-500' : 'bg-red-500'}`}></div>
                  </div>
                  
                  <p className="text-sm text-gray-400 mb-4">
                    Weight: {info.weight} of total Gatescore
                  </p>
                  
                  {isConnected ? (
                    <div>
                      <p className="text-sm text-green-400 mb-2">✓ Connected</p>
                      {platforms[platform]?.lastSync && (
                        <p className="text-xs text-gray-400 mb-3">
                          Last synced: {new Date(platforms[platform].lastSync).toLocaleString()}
                        </p>
                      )}
                      <button
                        onClick={() => disconnectPlatform(platform)}
                        className="w-full bg-red-600 hover:bg-red-700 px-4 py-2 rounded-md text-sm font-medium"
                      >
                        Disconnect
                      </button>
                    </div>
                  ) : (
                    <div>
                      <p className="text-sm text-gray-400 mb-3">Not connected</p>
                      {['epic', 'riot'].includes(platform) ? (
                        <button
                          disabled
                          className="w-full bg-gray-600 px-4 py-2 rounded-md text-sm font-medium opacity-50 cursor-not-allowed"
                        >
                          Coming Soon
                        </button>
                      ) : (
                        <button
                          onClick={() => connectPlatform(platform)}
                          className="w-full bg-indigo-600 hover:bg-indigo-700 px-4 py-2 rounded-md text-sm font-medium"
                        >
                          Connect {info.name}
                        </button>
                      )}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>
      </main>
    </div>
  );
}

export default App;
