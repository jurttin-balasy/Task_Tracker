# 1. Base Image: Python 3.9 dıń jeńil (slim) versiyasın alamız
FROM python:3.10.7

# 2. Python ortalıq ózgeriwshileri (optimizaciya)
# .pyc fayllardı jazbaw ushın (diskke jazıwdı azaytadı)
ENV PYTHONDONTWRITEBYTECODE 1
# Loglardı buferlemey, tikkeley terminalǵa shıǵarıw ushın
ENV PYTHONUNBUFFERED 1

# 3. Jumıs papkası: Konteyner ishindegi /app papkasında isleymiz
WORKDIR /app

# 4. Kitapxanalardı ornatıw
# Dáslep tek requirements.txt faylın kóshiremiz (Keshlew ushın paydalı)
COPY requirements.txt .
# pip-ti jańalap, kitapxanalardı ornatamız
RUN pip install --upgrade pip && pip install -r requirements.txt

# 5. Kodtı kóshiriw
# Qalǵan barlıq fayllardı konteynerge kóshiremiz
COPY . .

# 6. Iske túsiriw buyrıǵı
# Serverde runserver EMES, Gunicorn isletiw kerek
# config - bul siziń joybarıńızdıń settings.py turǵan papka atı
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8080