# Generated by Django 2.0 on 2018-06-18 13:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cine', '0002_auto_20180615_1818'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pelicula',
            name='sinopsis',
            field=models.TextField(),
        ),
    ]