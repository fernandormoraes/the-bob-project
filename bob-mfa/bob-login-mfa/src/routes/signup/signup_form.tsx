
import './style.css';
import { ISignUpUseCase, SignUpUseCaseParams } from '../../domain/usecases/sign_up_usecase';
import { useState } from 'react';

export interface SignUpFormProps {
    signUpUseCase: ISignUpUseCase;
}

export default function SignUpForm(props: SignUpFormProps) {

    // States for registration
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPassword, setConfirmPassword] = useState('');

    // States for checking the errors
    const [submitted, setSubmitted] = useState(false);
    const [error, setError] = useState(false);
    const [passwordUnmatch, setPasswordUnmatch] = useState(false);

    // Handling the name change
    const handleName = (e) => {
        setName(e.target.value);
        setSubmitted(false);
    };

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

    // Handling the password confirm change
    const handleConfirmPassword = (e) => {
        setConfirmPassword(e.target.value);
        setSubmitted(false);
    };


    // Handling the form submission
    const handleSubmit = (e) => {
        e.preventDefault();
        if (name === '' || email === '' || password === '' || confirmPassword === '') {
            setError(true);
        } else if (password !== confirmPassword) {
            setPasswordUnmatch(true);
        } else {
            const params: SignUpUseCaseParams = {
                username: email,
                password: password,
                name: name
            }

            props.signUpUseCase.call(params).then(() => {
                setSubmitted(true);
                setError(false);
                setPasswordUnmatch(false);

                setEmail("")
                setName("")
                setPassword("")
                setConfirmPassword("")
            })
        }
    };

    // Showing success message
    const successMessage = () => {
        return (
            <div
                className="success"
                style={{
                    display: submitted ? '' : 'none',
                }}>
                <h1>User {name} successfully registered!!</h1>
            </div>
        );
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

    const passwordUnmatchMessage = () => {
        return (
            <div
                className="error"
                style={{
                    display: passwordUnmatch ? '' : 'none',
                }}>
                <h1>Passwords Unmatch</h1>
            </div>
        );
    };

    return (
        <div className="w-full flex justify-center items-center bg-gray-900 p-8 border-r border-dashed">
            <div className="w-1/2 shadow-lg rounded-md bg-white p-8 flex flex-col" style={{ height: '475px' }}>
                <div className="form">

                    {/* Calling to the methods */}
                    <div className="messages">
                        {errorMessage()}
                        {passwordUnmatchMessage()}
                        {successMessage()}
                    </div>

                    <form>
                        {/* Labels and inputs for form data */}
                        <label className="label">Name</label>
                        <input onChange={handleName} className="input"
                            value={name} type="text" />

                        <label className="label">Email</label>
                        <input onChange={handleEmail} className="input"
                            value={email} type="email" />

                        <label className="label">Password</label>
                        <input onChange={handlePassword} className="input"
                            value={password} type="password" />

                        <label className="label">Confirm Password</label>
                        <input onChange={handleConfirmPassword} className="input"
                            value={confirmPassword} type="password" />

                        <button onClick={handleSubmit} className="btn" type="submit">
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
}