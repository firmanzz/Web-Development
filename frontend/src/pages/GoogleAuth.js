import React, { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Cookies from 'js-cookie';

const GoogleAuth = () => {
    const navigate = useNavigate();

    useEffect(() => {
        // Ambil token dan role dari query parameter di URL
        const urlParams = new URLSearchParams(window.location.search);
        const token = urlParams.get('token');
        const role = urlParams.get('role');
        const name = urlParams.get('name');
        
        if (token) {
            // Simpan token dan role di cookies
            Cookies.set('token', token);
            Cookies.set('role', role);
            Cookies.set('name', name);

            if (role === 'admin') {
                navigate('/admin');
            } else {
                navigate('/');
            }
        } 
    }, [navigate]);

    return (
        <div>
            <h1>Loading authentication...</h1>
        </div>
    );
};

export default GoogleAuth;