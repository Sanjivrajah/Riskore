import hashlib
import base64
from cryptography.fernet import Fernet
from typing import Union, Dict, Any
import re
import numpy as np
from flask import jsonify


class AdvancedDataMasker:
    def __init__(self):
        self.key = Fernet.generate_key()
        self.cipher_suite = Fernet(self.key)
        self.salt = b'$2b$12$LQv3c1yqBWVHxkd0LHAkCO'
        self.masking_patterns = {
            'email': r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            'phone': r'^\+?1?\d{9,15}$',
            'credit_card': r'^\d{16}$',
            'ssn': r'^\d{3}-?\d{2}-?\d{4}$'
        }

    def _hash_sensitive_data(self, data: str) -> str:
        """Hash sensitive data using bcrypt-like algorithm"""
        return hashlib.blake2b(
            data.encode(),
            salt=self.salt,
            person=b'sensitive_data',
            digest_size=16
        ).hexdigest()

    def _encrypt_data(self, data: str) -> bytes:
        """Encrypt data using Fernet (symmetric encryption)"""
        return self.cipher_suite.encrypt(data.encode())

    def _tokenize_pii(self, data: str, pattern_type: str) -> str:
        """Replace PII with tokens while maintaining format"""
        if re.match(self.masking_patterns[pattern_type], data):
            if pattern_type == 'email':
                parts = data.split('@')
                return f"{self._hash_sensitive_data(parts[0])[:6]}@{parts[1]}"
            elif pattern_type in ['phone', 'credit_card', 'ssn']:
                return '*' * len(data)
        return data

    def _apply_differential_privacy(self, value: float, epsilon: float = 0.1) -> float:
        """Add Laplace noise for differential privacy"""
        sensitivity = 1.0
        noise = np.random.laplace(0, sensitivity / epsilon)
        return value + noise

    def _k_anonymize(self, data: Dict[str, Any], k: int = 5) -> Dict[str, Any]:
        """Implement k-anonymity by generalizing quasi-identifiers"""
        anonymized_data = data.copy()

        # Age generalization
        if 'age' in anonymized_data:
            age = anonymized_data['age']
            anonymized_data['age'] = f"{(age // 5) * 5}-{((age // 5) * 5) + 4}"

        # Income generalization
        if 'monthly_income' in anonymized_data:
            income = anonymized_data['monthly_income']
            anonymized_data['monthly_income'] = f"{(income // 10000) * 10000}-{((income // 10000) * 10000) + 9999}"

        return anonymized_data

    def mask_sensitive_data(self, data: Dict[str, Any]) -> Dict[str, Any]:
        """Main method to apply all masking techniques"""
        masked_data = {}

        for key, value in data.items():
            if isinstance(value, str):
                # Apply PII tokenization
                for pattern_type in self.masking_patterns:
                    value = self._tokenize_pii(value, pattern_type)

                # Encrypt non-PII strings
                if not any(re.match(pattern, value) for pattern in self.masking_patterns.values()):
                    value = self._encrypt_data(value)

            elif isinstance(value, (int, float)):
                # Apply differential privacy to numerical values
                value = self._apply_differential_privacy(float(value))

            masked_data[key] = value

        # Apply k-anonymity
        masked_data = self._k_anonymize(masked_data)

        return masked_data

    def unmask_data(self, masked_data: Dict[str, Any]) -> Dict[str, Any]:
        """Reverse masking for authorized access"""
        unmasked_data = {}

        for key, value in masked_data.items():
            if isinstance(value, bytes):
                try:
                    value = self.cipher_suite.decrypt(value).decode()
                except:
                    pass
            unmasked_data[key] = value

        return unmasked_data


