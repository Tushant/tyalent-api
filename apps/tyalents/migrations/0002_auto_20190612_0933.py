# Generated by Django 2.2.2 on 2019-06-12 09:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('tyalents', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='tyalent',
            old_name='Profile',
            new_name='profile',
        ),
    ]
