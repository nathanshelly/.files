import sys
import json

commands = [
    {
        'title': 'On',
        'arg': 'on',
        'command_list': ['on', 'up', 'activate'],
        'autocomplete': 'Bluetooth On'
    },
    {
        'title': 'Off',
        'arg': 'off',
        'command_list': ['off', 'down', 'deactivate'],
        'autocomplete': 'Bluetooth Off'
    },
    {
        'title': 'Toggle',
        'arg': 'toggle',
        'command_list': ['toggle', 'change', 'switch'],
        'autocomplete': 'Bluetooth Toggle'
    },
    {
        'title': 'Restart',
        'arg': 'restart',
        'command_list': ['reset', 'restart'],
        'autocomplete': 'Bluetooth Restart'
    }
]


def suggest_command(query):
    """
    Return a JSON object with the commands that start with query.

    Parameters
    ----------
    query : str
        Query where the returned commands must start with

    Returns
    -------
    dict
        JSON ojbect of commands that start with query
    None
        No

    """
    query = query.strip()

    data = {
      "items": []
    }

    for command in commands:
        if any(item.startswith(query) for item in command['command_list']):
            # print(command['arg'])
            item = {
              'title': command['title'],
              'autocomplete': command['autocomplete'],
              'arg': command['arg']
            }

            data['items'].append(item)

    if data['items']:
        return data
    else:
        return None


def main(arg):
    res = suggest_command(arg)
    if res:
        print(json.dumps(res))


if __name__ == u'__main__':
    main(sys.argv[1] if len(sys.argv) > 1 else '')
