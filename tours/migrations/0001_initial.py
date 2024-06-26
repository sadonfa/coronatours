# Generated by Django 4.2.2 on 2023-06-07 04:49

import ckeditor.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tours',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='Nombre')),
                ('description', models.CharField(max_length=250, verbose_name='Descripcion')),
                ('image1', models.ImageField(default='null', upload_to='Imagen 1')),
                ('image2', models.ImageField(default='null', upload_to='Imagen 2')),
                ('image3', models.ImageField(default='null', upload_to='Imagen 3')),
                ('image4', models.ImageField(default='null', upload_to='Imagen 4')),
                ('info', ckeditor.fields.RichTextField(verbose_name='Info')),
                ('include', ckeditor.fields.RichTextField(verbose_name='Incluye')),
                ('noinclude', ckeditor.fields.RichTextField(verbose_name='No Incluye')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='Creado el')),
                ('update_at', models.DateTimeField(auto_now=True, verbose_name='Editado el')),
            ],
        ),
    ]
