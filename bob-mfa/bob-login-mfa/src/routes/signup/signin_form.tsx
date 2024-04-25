
import './style.css';
import { ISignInUseCase, SignInUseCaseParams } from '../../domain/usecases/sign_in_usecase';
import { useState } from 'react';
import { Navigate } from 'react-router-dom';
import { navigateToUrl } from 'single-spa';

export interface SignInFormProps {
    signInUseCase: ISignInUseCase;
}

export default function SignInForm(props: SignInFormProps) {

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');

    // States for checking the errors
    const [submitted, setSubmitted] = useState(false);
    const [error, setError] = useState(false);

    // Handling the email change
    const handleEmail = (e) => {
        setEmail(e.target.value);
        setSubmitted(false);
    };

    // Handling the password change
    const handlePassword = (e) => {
        setPassword(e.target.value);
        setSubmitted(false);
    };

    // Handling the form submission
    const handleSubmit = (e) => {
        e.preventDefault();
        if (email === '' || password === '') {
            setError(true);
        } else {
            const params: SignInUseCaseParams = {
                username: email,
                password: password
            }

            props.signInUseCase.call(params).then((user) => {
                setSubmitted(true);
                setError(false);

                if (user) {
                    navigateToUrl("home")
                }
            })
        }
    };

    // Showing error message if error is true
    const errorMessage = () => {
        return (
            <div
                className="error"
                style={{
                    display: error ? '' : 'none',
                }}>
                <h1>Please enter all the fields</h1>
            </div>
        );
    };

    return (
        <div className="w-full flex justify-center items-center bg-gray-900 p-8 border-r border-dashed">
            <div className="w-1/2 shadow-lg rounded-md bg-white p-8 flex flex-col" style={{ height: '375px' }}>
                <div className="form">

                    {/* Calling to the methods */}
                    <div className="messages">
                        {errorMessage()}
                    </div>

                    <form>

                        <label className="label">Email</label>
                        <input onChange={handleEmail} className="input"
                            value={email} type="email" />

                        <label className="label">Password</label>
                        <input onChange={handlePassword} className="input"
                            value={password} type="password" />

                        <button onClick={handleSubmit} className="btn" type="submit">
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
}